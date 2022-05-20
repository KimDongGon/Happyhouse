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
      <b-button variant="outline-info" @click="moveModifyQna" class="mb-1"
        >수정</b-button
      >
      <b-button variant="outline-danger" class="mb-1" @click="deleteQna"
        >삭제</b-button
      > </b-col
    ><br />
    답 변 :
    <b-row v-if="isAdmin">
      <b-col cols="12" md="11" style="padding: 0px 12px">
        <b-textarea
          clearable
          clear-icon="mdi-close-circle"
          rows="2"
          full-width
          v-model="comment"
        ></b-textarea>
      </b-col>
      <b-col md="1" align-self="center" style="padding: 0px 10px">
        <b-button variant="outline-primary" @click="saveReply">등록</b-button>
      </b-col>
    </b-row>
    <hr />
    <h5><b>댓글</b>({{ replyCount }})</h5>
    <hr />
    <b-simple-table>
      <b-tbody>
        <b-tr v-for="(reply, index) in replies" :key="index">
          <b-td style="width: 110px; padding: 0">
            <b-icon icon="person-fill" font-scale="1"></b-icon>
            <b>관리자</b>
          </b-td>
          <b-td style="padding: 0">{{ reply.content }}</b-td>
          <b-td style="width: 140px; padding: 0">{{ reply.regtime }}</b-td>
        </b-tr>
      </b-tbody>
    </b-simple-table>
  </b-container>
</template>

<script>
// import moment from "moment";
import http from "@/api/http";
import { mapGetters } from "vuex";
export default {
  name: "QnaDetail",
  data() {
    return {
      qna: {},
      replies: {},
      replyCount: 0,
    };
  },
  computed: {
    message() {
      if (this.qna.content) return this.qna.content.split("\n").join("<br>");
      return "";
    },
    ...mapGetters(["isAdmin"]),
  },
  created() {
    http.get(`/qna/${this.$route.params.no}`).then(({ data }) => {
      this.qna = data;
    });
    http.get(`/qna/reply/${this.$route.params.no}`).then(({ data }) => {
      this.replies = data;
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
