import http from "@/api/http";

export default {
  namespaced: true,
  state: {
    sido: [{ value: null, text: "시/도 선택" }],
    gugun: [{ value: null, text: "구/군 선택" }],
    dong: [{ value: null, text: "동 선택" }],
    sidoCode: null,
    gugunCode: null,
    dongCode: null,
  },
  mutations: {
    SET_SIDO(state, sidos) {
      console.log(state);
      state.sido = [{ value: null, text: "시/도 선택" }].concat(
        sidos.map((sido) => {
          return {
            value: sido.sidoCode,
            text: sido.sidoName,
          };
          // eslint-disable-next-line prettier/prettier
        })
      );
    },
    SET_GUGUN(state, guguns) {
      state.gugun = [{ value: null, text: "구/군 선택" }].concat(
        guguns.map((gugun) => {
          return {
            value: gugun.gugunCode,
            text: gugun.gugunName,
          };
          // eslint-disable-next-line prettier/prettier
        })
      );
    },
    SET_DONG(state, dongs) {
      state.dong = [{ value: null, text: "동 선택" }].concat(
        dongs.map((dong) => {
          return {
            value: dong.dongCode,
            text: dong.dongName,
          };
          // eslint-disable-next-line prettier/prettier
        })
      );
    },
    SET_SIDO_CODE(state, sidoCode) {
      state.sidoCode = sidoCode;
    },
    SET_GUGUN_CODE(state, gugunCode) {
      state.gugunCode = gugunCode;
    },
    SET_DONG_CODE(state, dongCode) {
      state.dongCode = dongCode;
    },
  },
  actions: {
    getSido({ commit }) {
      http
        .get("/code/sido")
        .then((res) => {
          if (res.status == 200) {
            commit("SET_SIDO", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    getGugun({ commit }, sidoCode) {
      http
        .get("/code/gugun", { params: { sidoCode } })
        .then((res) => {
          if (res.status == 200) {
            commit("SET_GUGUN", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    getDong({ commit }, { sidoCode, gugunCode }) {
      http
        .get("/code/dong", { params: { sidoCode, gugunCode } })
        .then((res) => {
          if (res.status == 200) {
            commit("SET_DONG", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    setSidoCode({ commit }, sidoCode) {
      commit("SET_SIDO_CODE", sidoCode);
    },
    setGugunCode({ commit }, gugunCode) {
      commit("SET_GUGUN_CODE", gugunCode);
    },
    setDongCode({ commit }, dongCode) {
      commit("SET_DONG_CODE", dongCode);
    },
  },
};
