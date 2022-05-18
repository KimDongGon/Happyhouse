<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>QnA 상세보기</h3></b-alert>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-left">
        <b-button variant="outline-primary" @click="listQna">목록</b-button>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col>
        <b-card
          :header-html="`<h3>${qna.no}.
          ${qna.title} [${qna.hit}]</h3><div><h6> 작성자 ID : ${qna.id}</div><div> 등록 날짜 : ${qna.regtime}</h6></div>`"
          class="mb-2"
          border-variant="dark"
          no-body
        >
          <b-card-body class="text-left">
            <div v-html="message"></div>
          </b-card-body>
        </b-card>
      </b-col>
    </b-row>
    <b-col class="text-left">
      <b-button
        variant="outline-info"
        size="sm"
        @click="moveModifyQna"
        class="mr-2"
        >수정</b-button
      >
      <b-button variant="outline-danger" size="sm" @click="deleteQna"
        >삭제</b-button
      >
    </b-col>
  </b-container>
</template>

<script>
// import moment from "moment";
import http from "@/api/http";

export default {
  name: "QnaDetail",
  data() {
    return {
      qna: {},
    };
  },
  computed: {
    message() {
      if (this.qna.content) return this.qna.content.split("\n").join("<br>");
      return "";
    },
  },
  created() {
    http.get(`/qna/${this.$route.params.no}`).then(({ data }) => {
      this.qna = data;
    });
  },
  methods: {
    listQna() {
      this.$router.push({ name: "qnaList" });
    },
    moveModifyQna() {
      this.$router.replace({
        name: "qnaModify",
        params: { no: this.qna.no },
      });
      //   this.$router.push({ path: `/board/modify/${this.article.articleno}` });
    },
    deleteQna() {
      if (confirm("정말로 삭제하시겠습니까?")) {
        this.$router.replace({
          name: "qnaDelete",
          params: { no: this.qna.no },
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
