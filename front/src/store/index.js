import Vue from "vue";
import Vuex from "vuex";
import router from "@/router";
import http from "@/api/http";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    userid: "",
    username: "",
    sido: [{ value: null, text: "시/도 선택" }],
    gugun: [{ value: null, text: "구/군 선택" }],
  },
  getters: {
    isLoggedIn(state) {
      return state.userid === "";
    },
    isAdmin(state) {
      return state.userid === "admin";
    },
  },
  mutations: {
    SET_LOGIN_USER(state, user) {
      state.userid = user.id;
      state.username = user.name;
    },
    LOGOUT(state) {
      state.userid = "";
      state.username = "";
    },
    SET_SIDO(state, sidos) {
      state.sido = [{ value: null, text: "시/도 선택" }].concat(
        sidos.map((sido) => {
          return {
            value: sido.sidoCode,
            text: sido.sidoName,
          };
          // eslint-disable-next-line prettier/prettier
        })
      );
    },
    SET_GUGUN(state, guguns) {
      state.gugun = [{ value: null, text: "구/군 선택" }].concat(
        guguns.map((gugun) => {
          return {
            value: gugun.gugunCode,
            text: gugun.gugunName,
          };
          // eslint-disable-next-line prettier/prettier
        })
      );
    },
  },
  actions: {
    getSido({ commit }) {
      http
        .get("/code/sido")
        .then((response) => {
          if (response.status == 200) {
            commit("SET_SIDO", response.data);
          }
        })
        .catch((err) => console.log(err));
    },
    getGugun({ commit }, sidoCode) {
      http
        .get("/code/gugun", { params: { sidoCode } })
        .then((response) => {
          if (response.status == 200) {
            commit("SET_GUGUN", response.data);
          }
        })
        .catch((err) => console.log(err));
    },
    getDong() {},
    getHouseList() {},
    loginUser({ commit }, user) {
      http
        .post("/login", user)
        .then((response) => {
          if (response.status === 200) {
            commit("SET_LOGIN_USER", response.data);
            router.push("/");
          } else {
            alert("회원 정보가 존재하지 않습니다.");
          }
        })
        .catch((err) => console.log(err));
    },
    logout({ commit }) {
      console.log("hello");
      commit("LOGOUT");
    },
  },
  modules: {},
});
