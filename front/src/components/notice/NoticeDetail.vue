<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show
          ><h3>
            <b-icon icon="exclamation-circle-fill"></b-icon> 공지사항
          </h3></b-alert
        >
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-left">
        <b-button variant="outline-primary" @click="listNotice">목록</b-button>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col>
        <b-card
          :header-html="`<h3>${notice.no}.
          ${notice.subject} </h3><div><h6> 작성자 ID : admin</div><div> 등록 날짜 : ${notice.regtime}</h6></div>`"
          class="mb-2"
          border-variant="dark"
          no-body
        >
          <b-card-body class="text-left" style="height: 200px">
            <div v-html="message"></div>
          </b-card-body>
        </b-card>
      </b-col>
    </b-row>
    <b-col style="text-align: end" v-if="isAdmin">
      <b-button variant="outline-info" @click="moveModifyNotice" class="mb-1"
        >수정</b-button
      >
      <b-button variant="outline-danger" class="mb-1" @click="deleteNotice"
        >삭제</b-button
      >
    </b-col>
  </b-container>
</template>

<script>
// import moment from "moment";
import http from "@/api/http";
import { mapGetters } from "vuex";

export default {
  name: "NoticeDetail",
  data() {
    return {
      notice: {},
    };
  },
  computed: {
    message() {
      if (this.notice.content)
        return this.notice.content.split("\n").join("<br>");
      return "";
    },
    ...mapGetters(["isAdmin"]),
  },
  created() {
    http.get(`/notice/list/${this.$route.params.no}`).then(({ data }) => {
      this.notice = data;
    });
  },
  methods: {
    listNotice() {
      this.$router.push({ name: "noticeList" });
    },
    moveModifyNotice() {
      this.$router.replace({
        name: "noticeModify",
        params: { no: this.notice.no },
      });
      //   this.$router.push({ path: `/board/modify/${this.article.articleno}` });
    },
    deleteNotice() {
      if (confirm("정말로 삭제하시겠습니까?")) {
        this.$router.replace({
          name: "noticeDelete",
          params: { no: this.notice.no },
        });
      }
    },
  },
  // filters: {
  //   dateFormat(regtime) {
  //     return moment(new Date(regtime)).format("YY.MM.DD hh:mm:ss");
  //   },
  // },
};
</script>

<style></style>
