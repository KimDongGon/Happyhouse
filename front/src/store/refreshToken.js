export default {
  namespaced: true,
  state: {
    refreshToken: null,
  },
  mutations: {
    DELETE_REFRESH_TOKEN(state) {
      state.refreshToken = null;
    },
    SET_REFRESH_TOKEN(state, refreshToken) {
      // refresh token은 xss 공격에 좀 더 안전한 cookie에 저장
      state.refreshToken = refreshToken;
    },
  },
  actions: {
    deleteRefreshToken({ commit }) {
      commit("DELETE_REFRESH_TOKEN");
    },
  },
};
