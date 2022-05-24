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
    config.headers.common.ACCESS_TOKEN = store.state.access.accessToken;
    config.headers.common.REFRESH_TOKEN = store.state.refresh.refreshToken;
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

    return Promise.reject(error);
    // eslint-disable-next-line prettier/prettier
  }
);
// axios 객체 생성
export default http;
