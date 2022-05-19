<template>
  <div>
    <h3 class="mt-5">거래정보</h3>
    <b-table :fields="houseFields" :items="houseList"></b-table>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
export default {
  name: "HouseSearchList",
  data() {
    return {};
  },
  computed: {
    ...mapState(["houseList, houseFields"]),
  },
  methods: {
    ...mapActions(["searchHouseList"]),
  },
  created() {
    this.searchHouseList();
  },
};
</script>

<style></style>
