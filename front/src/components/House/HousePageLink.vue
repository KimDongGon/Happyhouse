<template>
  <div class="overflow-auto">
    <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      aria-controls="my-table"
      limit="10"
      align="center"
    ></b-pagination>
  </div>
</template>

<script>
import http from "@/api/http";
import { mapActions, mapState } from "vuex";
export default {
  data() {
    return {
      perPage: 10,
      currentPage: 1,
      rows: 0,
      pageNavigation: {
        offset: 0,
        limit: 10,
        apartmentName: null,
      },
    };
  },
  methods: {
    ...mapActions("house", ["searchHouseList"]),
    movePage(page) {
      this.currentPage = page;
    },
    setApartmentName(apartmentName) {
      this.pageNavigation.apartmentName = apartmentName;
    },
  },
  computed: {
    ...mapState("code", ["dongCode"]),
  },
  watch: {
    currentPage(val) {
      this.pageNavigation.offset = (val - 1) * this.perPage;
      this.pageNavigation.limit = this.perPage;
      this.searchHouseList(this.pageNavigation);
    },
  },
  created() {
    http
      .get("/house/count", { params: { dongCode: this.dongCode } })
      .then((res) => {
        this.rows = res.data;
      })
      .catch((err) => {
        console.log(err);
      });
  },
};
</script>

<style></style>
