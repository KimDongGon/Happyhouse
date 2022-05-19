<template>
  <div>
    <b-row class="mt-5">
      <b-col cols="7">
        <h3>거래정보</h3>
      </b-col>
      <b-col cols="5">
        <b-input-group>
          <b-form-input
            placeholder="아파트명"
            v-model="aptName"
            @keyup.enter="search"
          ></b-form-input>
          <b-button variant="primary" @click="search">검색</b-button>
        </b-input-group>
      </b-col>
    </b-row>
    <b-table
      :fields="houseFields"
      :items="searchHouse"
      label-sort-asc=""
      label-sort-desc=""
      label-sort-clear=""
    ></b-table>
  </div>
</template>

<script>
import { mapState, mapActions, mapGetters } from "vuex";
export default {
  name: "HouseSearchList",
  data() {
    return {
      aptName: "",
    };
  },
  computed: {
    ...mapState(["houseFields"]),
    ...mapGetters(["searchHouse"]),
  },
  methods: {
    ...mapActions(["searchHouseList", "searchApt"]),
    search() {
      this.searchApt(this.aptName);
    },
  },
  created() {
    this.searchHouseList();
  },
  destroyed() {
    this.searchApt("");
  },
};
</script>

<style></style>
