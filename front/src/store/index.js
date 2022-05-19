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
    dong: [{ value: null, text: "동 선택" }],
    sidoCode: null,
    gugunCode: null,
    dongCode: null,
    houseList: [],
    houseFelds: [
      { key: "아파트명", sortable: true },
      { key: "거래금액", sortable: true },
      { key: "전용면적", sortable: true },
      { key: "거래일자", sortable: true },
    ],
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
    SET_DONG(state, dongs) {
      state.dong = [{ value: null, text: "동 선택" }].concat(
        dongs.map((dong) => {
          return {
            value: dong.dongCode,
            text: dong.dongName,
          };
          // eslint-disable-next-line prettier/prettier
        })
      );
    },
    SET_SIDO_CODE(state, sidoCode) {
      state.sidoCode = sidoCode;
    },
    SET_GUGUN_CODE(state, gugunCode) {
      state.gugunCode = gugunCode;
    },
    SET_DONG_CODE(state, dongCode) {
      state.dongCode = dongCode;
    },
    SET_HOUSE_LIST(state, houseList) {
      console.log(houseList);
      state.houseList = houseList.map((house) => {
        return {
          아파트명: house.aptName,
          거래금액: house.dealAmount,
          전용면적: house.area,
          거래일자: `${house.dealYear}년 ${house.dealMonth}월 ${house.dealDay}일`,
        };
      });
      console.log(state.houseList);
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
    getDong({ commit }, { sidoCode, gugunCode }) {
      http
        .get("/code/dong", { params: { sidoCode, gugunCode } })
        .then((response) => {
          if (response.status == 200) {
            commit("SET_DONG", response.data);
          }
        })
        .catch((err) => console.log(err));
    },
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
    searchHouseList({ commit, state }) {
      http
        .get("/house/search", {
          params: {
            sido: state.sidoCode,
            gugun: state.gugunCode,
            dong: state.dongCode,
          },
        })
        .then((response) => {
          if (response.status === 200) {
            commit("SET_HOUSE_LIST", response.data);
          }
        })
        .catch((err) => console.log(err));
    },
  },
  modules: {},
});
