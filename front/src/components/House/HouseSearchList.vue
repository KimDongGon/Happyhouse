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
      :items="houseList"
      label-sort-asc=""
      label-sort-desc=""
      label-sort-clear=""
      selectable
      ref="selectableTable"
      :select-mode="selectMode"
      @row-selected="onRowSelected"
    ></b-table>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
export default {
  name: "HouseSearchList",
  data() {
    return {
      aptName: "",
      selectMode: "range",
    };
  },
  computed: {
    ...mapState("house", ["houseFields", "houseList"]),
  },
  methods: {
    ...mapActions("house", ["searchHouseList"]),
    search() {
      this.$emit("searchApartmentName", {
        page: 1,
        apartmentName: this.aptName,
      });
    },
    onRowSelected(data) {
      if (data.length !== 0) {
        this.$emit("setLatlng", { lat: data[0].lat, lng: data[0].lng });
      }
    },
  },
  created() {
    const pageNavigation = {
      offset: 1,
      limit: 10,
    };
    this.searchHouseList(pageNavigation);
  },
};
</script>

<style></style>
