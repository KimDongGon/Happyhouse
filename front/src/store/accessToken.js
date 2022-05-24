import http from "@/api/http";

export default {
  namespaced: true,
  state: {
    accessToken: null,
    isAuthenticated: false,
  },
  mutations: {
    REFRESH_TOKEN(state, tokens) {
      state.accessToken = tokens.accessToken;
    },
    DELETE_ACCESS_TOKEN(state) {
      state.accessToken = null;
      state.isAuthenticated = false;
    },
    SET_ACCESS_TOKEN(state, accessToken) {
      // vuex는 session storeage이므로 localstorage 사용
      state.accessToken = accessToken;
      state.isAuthenticated = true;
    },
  },
  actions: {
    refreshAccessToken: ({ commit }) => {
      return new Promise((resolve, reject) => {
        http
          .post("/user/issue")
          .then((res) => {
            commit("REFRESH_TOKEN", res.data);
            resolve(res.data.accessToken);
          })
          .catch((err) => {
            console.log("issue 에러! " + err);
            reject(err.config.data);
          });
      });
    },
    deleteAccessToken({ commit }) {
      commit("DELETE_ACCESS_TOKEN");
    },
  },
};
