<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show
          ><h3><b-icon icon="question-circle-fill"></b-icon> QnA</h3></b-alert
        >
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
          ${qna.title}</h3><div><h6> 작성자 ID : ${qna.id}</div><div> 조회수 : ${qna.hit}회</div><div> 등록 날짜 : ${qna.regtime}</h6></div> <br/><div><h6> 내 용 : </h6></div>`"
          class="mb-2"
          border-variant="dark"
          no-body
        >
          <b-card-body style="height: 200px" class="text-left">
            <div v-html="message"></div>
          </b-card-body>
        </b-card>
      </b-col>
    </b-row>
    <b-row v-if="isAdmin">
      <label for="comment">답 변:</label>
      <b-col cols="12" md="11" style="padding: 0px 12px">
        <b-textarea
          id="content"
          v-model="content"
          clearable
          clear-icon="mdi-close-circle"
          rows="2"
          full-width
          placeholder="답변을 입력하세요."
        ></b-textarea>
      </b-col>
      <b-col md="1" align-self="center" style="padding: 0px 10px">
        <b-button variant="outline-primary" @click="saveReply">등록</b-button>
        <!-- <b-icon icon="pencil-square" font-scale="3" @click="saveReply"></b-icon> -->
      </b-col>
    </b-row>
    <hr />
    <h5><b>댓글</b>({{ qna.replycount }})</h5>
    <hr />
    <b-row class="mb-1">
      <b-table-simple>
        <b-tbody>
          <b-tr v-for="(reply, index) in replies" :key="index">
            <b-td style="width: 110px; padding: 10px">
              <b-icon icon="person-fill" font-scale="1"></b-icon>
              <b>관리자</b>
            </b-td>
            <b-td style="width: 800px; padding: 10px">{{ reply.content }}</b-td>
            <b-td style="width: 300px; padding: 10px">{{ reply.regtime }}</b-td>
            <b-td style="padding: 10px" v-if="isAdmin">
              <b-icon
                id="editBtn"
                icon="pencil-fill"
                font-scale="1"
                v-b-modal.editModal
              ></b-icon>
            </b-td>
            <b-modal id="editModal" hide-footer title="댓글 수정">
              <b-form>
                <b-form-group
                  id="content-group"
                  label="댓글:"
                  label-for="content"
                >
                  <b-form-textarea
                    id="content"
                    v-model="reply.content"
                  ></b-form-textarea>
                </b-form-group>
                <b-button
                  variant="primary"
                  class="mt-3"
                  @click="modifyReply(reply.replyno, reply.content)"
                  >수정</b-button
                >
                <b-button class="mt-3" block @click="$bvModal.hide('editModal')"
                  >취소</b-button
                >
              </b-form>
            </b-modal>
            <b-td style="padding: 10px" v-if="isAdmin">
              <b-icon
                icon="x-lg"
                font-scale="1"
                @click="deleteReply(reply.replyno)"
              ></b-icon>
            </b-td>
          </b-tr>
        </b-tbody>
      </b-table-simple>
    </b-row>
    <br />
    <b-row style="text-align: end" v-if="checkId(qna.id)">
      <b-col>
        <b-button variant="outline-info" @click="moveModifyQna" class="mt-3"
          >수정</b-button
        >
        <b-button variant="outline-danger" class="mt-3" @click="deleteQna"
          >삭제</b-button
        >
      </b-col>
    </b-row>
    <b-row style="text-align: end" v-if="isAdmin">
      <b-col>
        <b-button variant="outline-danger" class="mt-3" @click="deleteQna"
          >삭제</b-button
        >
      </b-col>
    </b-row>
    <br />
  </b-container>
</template>

<script>
// import moment from "moment";
import http from "@/api/http";
import { mapActions, mapGetters, mapState } from "vuex";
export default {
  name: "QnaDetail",
  data() {
    return {
      qna: {},
      replies: {},
      content: "",
    };
  },
  computed: {
    message() {
      if (this.qna.content) return this.qna.content.split("\n").join("<br>");
      return "";
    },
    ...mapGetters("user", ["isAdmin"]),
    ...mapState(["boardNo"]),
    ...mapState("user", ["userid"]),
  },
  created() {
    let no = this.$route.params.no;
    if (!this.$route.params.no) {
      no = this.boardNo;
    }

    http.get(`/qna/${no}`).then(({ data }) => {
      this.qna = data;
    });
    http.get(`/qna/reply/${no}`).then(({ data }) => {
      this.replies = data;
    });
  },
  methods: {
    ...mapActions(["setBoardNo"]),
    checkId(id) {
      return this.userid === id;
    },
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
          params: { no: this.qna.no, replyno: 0 },
        });
      }
    },
    saveReply() {
      http
        .post(`/qna/reply/regist/${this.qna.no}`, {
          no: this.qna.no,
          content: this.content,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "댓글이 등록되었습니다.";
          }
          alert(msg);
          this.setBoardNo(this.qna.no);
          // this.$router.go();
        });
    },
    modifyReply(replyno, content) {
      //console.log(content);
      //console.log(replyno);
      //console.log(this.qna.no);
      http
        .put(`/qna/reply/modify/${replyno}`, {
          content: content,
          replyno: replyno,
          no: this.qna.no,
        })
        .then(({ data }) => {
          let msg = "댓글 수정 중 문제가 발생했습니다.";
          if (data === "success") {
            msg = "댓글이 수정되었습니다.";
          }
          alert(msg);

          this.setBoardNo(this.qna.no);
        });
    },
    deleteReply(replyno) {
      if (confirm("댓글을 삭제하시겠습니까?")) {
        http
          .delete(`/qna/reply/delete`, {
            params: {
              replyno: replyno,
              no: this.qna.no,
            },
          })
          .then(({ data }) => {
            let msg = "삭제 처리 중 문제가 발생하였습니다.";
            if (data === "success") {
              msg = "삭제가 완료되었습니다.";
            }
            alert(msg);

            this.setBoardNo(this.qna.no);
            //console.log(this.qna.no);
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
