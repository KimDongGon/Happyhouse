import Vue from "vue";
import Vuex from "vuex";
import router from "@/router";
import http from "@/api/http";
import createPersistedState from "vuex-persistedstate";
import jwtDecoder from "jwt-decode";
import VueCookies from "vue-cookies";
import AccessToken from "@/store/accessToken.js";
import RefreshToken from "@/store/refreshToken.js";
import Code from "@/store/code.js";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    userid: "",
    username: "",
    useraddress: "",
    usermobile: "",
    houseList: [],
    houseFields: [
      { key: "aptName", label: "아파트명", sortable: true },
      { key: "dealAmount", label: "거래금액", sortable: true },
      { key: "area", label: "전용면적", sortable: true },
      { key: "dealDate", label: "거래일자", sortable: true },
    ],
    searchKeyword: "",
    boardNo: null,
  },
  getters: {
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
    LOGIN(state, tokens) {
      // vuex는 session storeage이므로 localstorage 사용
      state.access.accessToken = tokens.accessToken;
      state.access.isAuthenticated = true;

      // refresh token은 xss 공격에 좀 더 안전한 cookie에 저장
      state.refresh.refreshToken = tokens.refreshToken;

      const decoded = jwtDecoder(tokens.accessToken);
      state.userid = decoded.id;
      state.username = decoded.name;
      state.useraddress = decoded.address;
      state.usermobile = decoded.mobile;
    },
    LOGOUT(state) {
      state.access.accessToken = null;
      state.access.isAuthenticated = false;

      state.refresh.refreshToken = null;

      state.userid = "";
      state.username = "";
      state.useraddress = "";
      state.usermobile = "";
      router.push("/").catch(() => {});
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
    SET_BOARD_NO(state, boardNo) {
      state.boardNo = boardNo;
    },
  },
  actions: {
    loginUser({ commit }, user) {
      http
        .post("/user/login", user)
        .then((res) => {
          if (res.status === 200) {
            commit("LOGIN", res.data);
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
            sido: state.code.sidoCode,
            gugun: state.code.gugunCode,
            dong: state.code.dongCode,
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
    setBoardNo({ commit }, boardNo) {
      commit("SET_BOARD_NO", boardNo);
      router.go();
    },
  },
  strict: true,
  modules: {
    access: AccessToken,
    refresh: RefreshToken,
    code: Code,
  },
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
      storage: window.sessionStorage,
      paths: ["code"],
    }),
    createPersistedState({
      storage: localStorage,
      paths: ["access"],
    }),
    createPersistedState({
      storage: {
        getItem: (key) => VueCookies.get(key),
        setItem: (key, value) => VueCookies.set(key, value),
        removeItem: (key) => VueCookies.remove(key),
      },
      paths: ["refresh"],
    }),
  ],
});
