<template>
  <b-tr>
    <b-td>{{ subject }}</b-td>
    <b-td>admin</b-td>
    <b-td>{{ regtime | dateFormat }}</b-td>
    <!-- <b-td
      ><b-button variant="outline-primary" @click="moveDetail()"
        >보기</b-button
      ></b-td
    > -->
    <b-th class="text-left">
      <router-link :to="{ name: 'noticeDetail', params: { no: no } }"
        >클릭</router-link
      >
    </b-th>
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
    // moveDetail() {
    //   this.$router.replace({
    //     name: "noticeDetail",
    //     params: { no: this.notice.no },
    //   });
    // },
  },
};
</script>

<style></style>
