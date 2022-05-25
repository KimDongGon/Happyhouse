import http from "@/api/http";

export default {
  namespaced: true,
  state: {
    sido: [{ value: null, text: "시/도 선택" }],
    gugun: [{ value: null, text: "구/군 선택" }],
    dong: [{ value: null, text: "동 선택" }],
    sidoName: null,
    gugunName: null,
    dongCode: null,
  },
  mutations: {
    SET_SIDO(state, sidos) {
      state.sido = [{ value: null, text: "시/도 선택" }].concat(
        sidos.map((sido) => {
          return {
            value: sido.sidoName,
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
            value: gugun.gugunName,
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
    SET_SIDO_NAME(state, sidoName) {
      state.sidoName = sidoName;
    },
    SET_GUGUN_NAME(state, gugunName) {
      state.gugunName = gugunName;
    },
    SET_DONG_CODE(state, dongCode) {
      state.dongCode = dongCode;
    },
    INIT_GUGUN(state) {
      state.gugun = [{ value: null, text: "구/군 선택" }];
    },
    INIT_DONG(state) {
      state.dong = [{ value: null, text: "동 선택" }];
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
    getGugun({ commit }, sidoName) {
      http
        .get("/code/gugun", { params: { sidoName } })
        .then((res) => {
          if (res.status == 200) {
            console.log(res.data);
            commit("SET_GUGUN", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    getDong({ commit }, { sidoName, gugunName }) {
      http
        .get("/code/dong", { params: { sidoName, gugunName } })
        .then((res) => {
          if (res.status == 200) {
            commit("SET_DONG", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    setSidoName({ commit }, sidoName) {
      commit("SET_SIDO_NAME", sidoName);
    },
    setGugunName({ commit }, gugunName) {
      commit("SET_GUGUN_NAME", gugunName);
    },
    setDongCode({ commit }, dongCode) {
      commit("SET_DONG_CODE", dongCode);
    },
    initGugun({ commit }) {
      commit("INIT_GUGUN");
    },
    initDong({ commit }) {
      commit("INIT_DONG");
    },
  },
};
