<template>
  <b-tr>
    <b-td>{{ subject }}</b-td>
    <b-td>admin</b-td>
    <b-td>{{ regtime | dateFormat }}</b-td>
    <b-td
      ><b-button variant="outline-primary" @click="moveDetail()"
        >보기</b-button
      ></b-td
    >
  </b-tr>
</template>

<script>
import moment from "moment";

export default {
  name: "NoticeListItem",
  props: {
    no: Number,
    subject: String,
    regtime: String,
  },
  filters: {
    dateFormat(regtime) {
      return moment(new Date(regtime)).format("YY.MM.DD");
    },
  },
  methods: {
    moveDetail() {
      this.$router.push({ name: "noticeDetail" });
    },
  },
};
</script>

<style></style>
