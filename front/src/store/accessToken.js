import http from "@/api/http";

export default {
  namespaced: true,
  state: {
    accessToken: null,
    isAuthenticated: false,
  },
  mutations: {
    REFRESH_TOKEN(state, tokens) {
      console.log(tokens);
      state.accessToken = tokens.accessToken;
    },
  },
  actions: {
    refreshAccessToken: ({ commit }) => {
      // accessToken 재요청
      //accessToken 만료로 재발급 후 재요청시 비동기처리로는 제대로 처리가 안되서 promise로 처리함
      return new Promise((resolve, reject) => {
        http
          .post("/user/issue")
          .then((res) => {
            commit("refreshToken", res.data);
            resolve(res.data);
          })
          .catch((err) => {
            console.log(err);
            reject(err.config.data);
          });
      });
    },
  },
};
