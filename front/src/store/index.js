import Vue from "vue";
import Vuex from "vuex";
import router from "@/router";
import http from "@/api/http";
import createPersistedState from "vuex-persistedstate";

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
    houseFields: [
      { key: "aptName", label: "아파트명", sortable: true },
      { key: "dealAmount", label: "거래금액", sortable: true },
      { key: "area", label: "전용면적", sortable: true },
      { key: "dealDate", label: "거래일자", sortable: true },
    ],
    searchKeyword: "",
  },
  getters: {
    isLoggedIn(state) {
      return state.userid === "";
    },
    isAdmin(state) {
      return state.userid === "admin";
    },
    searchHouse(state) {
      return state.houseList.filter((house) =>
        // eslint-disable-next-line prettier/prettier
        house.aptName.includes(state.searchKeyword)
      );
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
      state.houseList = houseList.map((house) => {
        return {
          aptName: house.aptName,
          dealAmount: house.dealAmount,
          area: house.area,
          dealDate: `${house.dealYear}년 ${house.dealMonth}월 ${house.dealDay}일`,
        };
      });
    },
    SET_SEARCH_KEYWORD(state, aptName) {
      state.searchKeyword = aptName;
    },
  },
  actions: {
    getSido({ commit }) {
      http
        .get("/code/sido")
        .then((res) => {
          if (res.status == 200) {
            commit("SET_SIDO", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    getGugun({ commit }, sidoCode) {
      http
        .get("/code/gugun", { params: { sidoCode } })
        .then((res) => {
          if (res.status == 200) {
            commit("SET_GUGUN", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    getDong({ commit }, { sidoCode, gugunCode }) {
      http
        .get("/code/dong", { params: { sidoCode, gugunCode } })
        .then((res) => {
          if (res.status == 200) {
            commit("SET_DONG", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    getHouseList() {},
    loginUser({ commit }, user) {
      http
        .post("/user/login", user)
        .then((res) => {
          if (res.status === 200) {
            commit("SET_LOGIN_USER", res.data);
            router.push("/");
          } else {
            alert("회원 정보가 존재하지 않습니다.");
          }
        })
        .catch((err) => console.log(err));
    },
    logout({ commit }) {
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
        .then((res) => {
          if (res.status === 200) {
            commit("SET_HOUSE_LIST", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    searchApt({ commit }, aptName) {
      commit("SET_SEARCH_KEYWORD", aptName);
    },
    signUp(_, userInfo) {
      http
        .post("/user/register", {
          id: userInfo.userId,
          password: userInfo.userPassword,
          name: userInfo.userName,
          address: userInfo.userAddress,
          number: userInfo.userMobile,
        })
        .then((res) => {
          if (res.status === 200) {
            alert("회원가입이 완료되었습니다.");
            router.push("/login");
          }
        })
        .catch((err) => console.log(err));
    },
  },
  modules: {},
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
      storage: sessionStorage,
    }),
  ],
});
