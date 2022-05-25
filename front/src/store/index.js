import Vue from "vue";
import Vuex from "vuex";
import router from "@/router";
import createPersistedState from "vuex-persistedstate";
import VueCookies from "vue-cookies";
import AccessToken from "@/store/accessToken.js";
import RefreshToken from "@/store/refreshToken.js";
import Code from "@/store/code.js";
import User from "@/store/user.js";
import House from "@/store/house.js";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    boardNo: null,
  },

  mutations: {
    SET_BOARD_NO(state, boardNo) {
      state.boardNo = boardNo;
    },
  },
  actions: {
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
    house: House,
  },
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
      storage: window.sessionStorage,
      paths: ["code", "house"],
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
