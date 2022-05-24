import jwtDecoder from "jwt-decode";
import router from "@/router";
import http from "@/api/http";

export default {
  namespaced: true,
  state: {
    userid: "",
    username: "",
    useraddress: "",
    usermobile: "",
  },
  getters: {
    isAdmin(state) {
      return state.userid === "admin";
    },
  },
  mutations: {
    SET_USER_INFO(state, tokens) {
      const decoded = jwtDecoder(tokens.accessToken);
      state.userid = decoded.id;
      state.username = decoded.name;
      state.useraddress = decoded.address;
      state.usermobile = decoded.mobile;
    },
    DELETE_USER_INFO(state) {
      state.userid = "";
      state.username = "";
      state.useraddress = "";
      state.usermobile = "";
      router.push("/").catch(() => {});
    },
  },
  actions: {
    login({ commit }, user) {
      http
        .post("/user/login", user)
        .then((res) => {
          if (res.status === 200) {
            commit("SET_USER_INFO", res.data);
            commit("access/SET_ACCESS_TOKEN", res.data.accessToken, {
              root: true,
            });
            commit("refresh/SET_REFRESH_TOKEN", res.data.refreshToken, {
              root: true,
            });
            router.push("/");
          } else {
            alert("회원 정보가 존재하지 않습니다.");
          }
        })
        .catch((err) => console.log(err));
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
    deleteUserInfo({ commit }) {
      commit("DELETE_USER_INFO");
    },
  },
};
