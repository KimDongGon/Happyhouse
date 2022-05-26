import Vue from "vue";
import Vuex from "vuex";
import createPersistedState from "vuex-persistedstate";
import VueCookies from "vue-cookies";
import AccessToken from "@/store/accessToken.js";
import RefreshToken from "@/store/refreshToken.js";
import Code from "@/store/code.js";
import User from "@/store/user.js";
import House from "@/store/house.js";
import Board from "@/store/board.js";

Vue.use(Vuex);

export default new Vuex.Store({
  strict: true,
  modules: {
    access: AccessToken,
    refresh: RefreshToken,
    code: Code,
    user: User,
    house: House,
    board: Board,
  },
  plugins: [
    createPersistedState({
      // 브라우저 종료시 제거하기 위해 localStorage가 아닌 sessionStorage로 변경. (default: localStorage)
      storage: window.sessionStorage,
      paths: ["code", "house", "board"],
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
