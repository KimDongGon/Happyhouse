import router from "@/router";

export default {
  namespaced: true,
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
};
