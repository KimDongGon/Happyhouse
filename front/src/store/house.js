import http from "@/api/http";

export default {
  namespaced: true,
  state: {
    houseList: [],
    houseFields: [
      { key: "aptName", label: "아파트명", sortable: true },
      { key: "dealAmount", label: "거래금액", sortable: true },
      { key: "area", label: "전용면적", sortable: true },
      { key: "dealDate", label: "거래일자", sortable: true },
    ],
  },
  getters: {
    searchHouse(state) {
      return state.houseList.filter((house) =>
        // eslint-disable-next-line prettier/prettier
        house.aptName.includes(state.searchKeyword)
      );
    },
    houseList(state) {
      return state.houseList;
    },
  },
  mutations: {
    SET_HOUSE_LIST(state, houseList) {
      state.houseList = houseList.map((house) => {
        return {
          aptName: house.apartmentName,
          dealAmount: `${house.dealAmount}만원`,
          area: house.area,
          dealDate: `${house.dealYear}년 ${house.dealMonth}월 ${house.dealDay}일`,
          lat: house.lat,
          lng: house.lng,
        };
      });
    },
    INIT_HOUSE_LIST(state) {
      state.houseList = [];
    },
  },
  actions: {
    searchHouseList({ commit, rootState }, pageNavigation) {
      http
        .get("/house/search", {
          params: {
            dongCode: rootState.code.dongCode,
            ...pageNavigation,
          },
        })
        .then((res) => {
          if (res.status === 200) {
            commit("SET_HOUSE_LIST", res.data);
          }
        })
        .catch((err) => console.log(err));
    },
    initHouseList({ commit }) {
      commit("INIT_HOUSE_LIST");
    },
  },
};
