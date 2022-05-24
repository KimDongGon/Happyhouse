import axios from "axios";
import store from "@/store";

const http = axios.create({
  baseURL: "http://localhost:9999/",
  headers: {
    "Content-type": "application/json",
  },
});

http.interceptors.request.use((config) => {
  const isAuthenticated = store.state.access.isAuthenticated;
  if (isAuthenticated) {
    config.headers.ACCESS_TOKEN = store.state.access.accessToken;
    config.headers.REFRESH_TOKEN = store.state.refresh.refreshToken;
  }
  return config;
});

http.interceptors.response.use(
  (response) => {
    return response;
  },
  async (error) => {
    const errorAPI = error.config;
    if (error.response.status === 401 && errorAPI.retry === undefined) {
      errorAPI.retry = true;
      await store.dispatch("access/refreshAccessToken");
      return await http(errorAPI);
    }

    // alert("로그인 정보가 만료되었습니다. 다시 로그인 해주세요.");
    return Promise.reject(error);
    // eslint-disable-next-line prettier/prettier
  }
);
// axios 객체 생성
export default http;
