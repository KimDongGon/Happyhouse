<template>
  <b-row class="mb-1">
    <b-col style="text-align: left">
      <b-form @submit="onSubmit" @reset="onReset">
        <b-form-group
          id="id-group"
          label="작성자ID:"
          label-for="id"
          v-if="this.type === 'register'"
        >
          <b-form-input
            id="id"
            v-model="userid"
            ref="id"
            type="text"
            required
            readonly="readonly"
          ></b-form-input>
        </b-form-group>
        <b-form-group id="id-group" label="작성자ID:" label-for="id" v-else>
          <b-form-input
            id="id"
            v-model="qna.id"
            ref="id"
            type="text"
            required
            placeholder="작성자 ID입력..."
            readonly="readonly"
          ></b-form-input>
        </b-form-group>

        <b-form-group id="title-group" label="제목:" label-for="title">
          <b-form-input
            id="title"
            v-model="qna.title"
            ref="title"
            type="text"
            required
            placeholder="제목 입력..."
          ></b-form-input>
        </b-form-group>

        <b-form-group id="content-group" label="내용:" label-for="content">
          <b-form-textarea
            id="content"
            v-model="qna.content"
            ref="content"
            placeholder="내용 입력..."
            rows="10"
            max-rows="15"
          ></b-form-textarea>
        </b-form-group>

        <b-button
          type="submit"
          variant="primary"
          class="mt-3"
          v-if="this.type === 'register'"
          >등록</b-button
        >
        <b-button type="submit" variant="primary" class="mt-3" v-else
          >수정</b-button
        >
        <b-button type="reset" variant="danger" class="mt-3">초기화</b-button>
      </b-form>
    </b-col>
  </b-row>
</template>

<script>
import http from "@/api/http";
import { mapState } from "vuex";

export default {
  name: "QnaInputItem",
  data() {
    return {
      qna: {
        no: 0,
        id: "",
        title: "",
        content: "",
      },
    };
  },
  props: {
    type: { type: String },
  },
  computed: {
    ...mapState("user", ["userid"]),
  },
  created() {
    if (this.type === "modify") {
      http.get(`/qna/${this.$route.params.no}`).then(({ data }) => {
        this.qna = data;
      });
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();

      let err = true;
      let msg = "";
      !this.qna.title &&
        ((msg = "제목 입력해주세요"), (err = false), this.$refs.title.focus());
      err &&
        !this.qna.content &&
        ((msg = "내용 입력해주세요"),
        (err = false),
        this.$refs.content.focus());

      if (!err) alert(msg);
      else this.type === "register" ? this.registQna() : this.modifyQna();
    },
    onReset(event) {
      event.preventDefault();
      this.qna.no = 0;
      this.qna.title = "";
      this.qna.content = "";
      //      this.$router.push({ name: "qnaList" });
    },
    registQna() {
      http
        .post(`/qna/regist`, {
          id: this.userid,
          title: this.qna.title,
          content: this.qna.content,
        })
        .then(({ data }) => {
          let msg = "등록 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        });
    },
    modifyQna() {
      http
        .put(`/qna/modify/${this.qna.no}`, {
          no: this.qna.no,
          id: this.qna.id,
          title: this.qna.title,
          content: this.qna.content,
        })
        .then(({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          // 현재 route를 /list로 변경.
          this.$router.push({ name: "qnaList" });
        });
    },
    moveList() {
      this.$router.push({ name: "qnaList" });
    },
  },
};
</script>

<style></style>
