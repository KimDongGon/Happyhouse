<template>
  <b-row class="mb-1">
    <b-col style="text-align: left">
      <b-form @submit="onSubmit" @reset="onReset">
        <b-form-group id="subject-group" label="제목:" label-for="subject">
          <b-form-input
            id="subject"
            v-model="notice.subject"
            ref="subject"
            type="text"
            required
            placeholder="제목 입력..."
          ></b-form-input>
        </b-form-group>

        <b-form-group id="content-group" label="내용:" label-for="content">
          <b-form-textarea
            id="content"
            v-model="notice.content"
            ref="content"
            placeholder="내용 입력..."
            rows="10"
            max-rows="15"
          ></b-form-textarea>
        </b-form-group>

        <b-button
          type="submit"
          variant="primary"
          class="mb-1"
          v-if="this.type === 'register'"
          >등록</b-button
        >
        <b-button type="submit" variant="primary" class="mb-1" v-else
          >수정</b-button
        >
        <b-button type="reset" variant="danger" class="mb-1">초기화</b-button>
      </b-form>
    </b-col>
  </b-row>
</template>

<script>
import http from "@/api/http";

export default {
  name: "NoticeInputItem",
  data() {
    return {
      notice: {
        no: 0,
        title: "",
        content: "",
      },
    };
  },
  props: {
    type: { type: String },
  },
  created() {
    if (this.type === "modify") {
      http.get(`/notice/list/${this.$route.params.no}`).then(({ data }) => {
        this.notice = data;
      });
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();

      let err = true;
      let msg = "";

      !this.notice.subject &&
        ((msg = "제목 입력해주세요"),
        (err = false),
        this.$refs.subject.focus());
      err &&
        !this.notice.content &&
        ((msg = "내용 입력해주세요"),
        (err = false),
        this.$refs.content.focus());

      if (!err) alert(msg);
      else this.type === "register" ? this.registNotice() : this.modifyNotice();
    },
    onReset(event) {
      event.preventDefault();
      this.notice.no = 0;
      this.notice.subject = "";
      this.notice.content = "";
      //      this.$router.push({ name: "qnaList" });
    },
    registNotice() {
      http
        .post(`/notice/list`, {
          subject: this.notice.subject,
          content: this.notice.content,
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
    modifyNotice() {
      http
        .put(`/notice/list/${this.notice.no}`, {
          no: this.notice.no,
          subject: this.notice.subject,
          content: this.notice.content,
        })
        .then(({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          // 현재 route를 /list로 변경.
          this.$router.push({ name: "noticeList" });
        });
    },
    moveList() {
      this.$router.push({ name: "noticeList" });
    },
  },
};
</script>

<style></style>
