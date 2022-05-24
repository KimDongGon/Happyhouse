import Vue from "vue";
import Vuex from "vuex";
import router from "@/router";
import http from "@/api/http";
import createPersistedState from "vuex-persistedstate";
import VueCookies from "vue-cookies";
import AccessToken from "@/store/accessToken.js";
import RefreshToken from "@/store/refreshToken.js";
import Code from "@/store/code.js";
import User from "@/store/user.js";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
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
    searchHouse(state) {
      return state.houseList.filter((house) =>
        // eslint-disable-next-line prettier/prettier
        house.aptName.includes(state.searchKeyword)
      );
    },
  },
  mutations: {
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
    user: User,
  },
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
      storage: window.sessionStorage,
      paths: ["code"],
    }),
    createPersistedState({
      storage: localStorage,
      paths: ["access", "user"],
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
