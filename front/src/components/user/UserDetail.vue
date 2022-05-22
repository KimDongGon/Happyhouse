<template>
  <b-container class="bv-example-row mt-3 text-center">
    <b-row>
      <b-col>
        <h3 class="underline-hotpink">
          <b-icon icon="list"></b-icon> 내정보조회
        </h3>
      </b-col>
    </b-row>

    <hr class="my-4" />
    <b-row style="text-align: center">
      <b-col>
        <b-button variant="primary" @click="moveHome()">메인화면</b-button>
      </b-col>
    </b-row>
    <b-jumbotron>
      <b-container class="mt-4">
        <b-row>
          <b-col cols="2"></b-col>
          <b-col cols="2" align-self="end">아이디</b-col
          ><b-col cols="4" align-self="start" style="padding: 10px">{{
            user.id
          }}</b-col>
          <b-col cols="2"></b-col>
        </b-row>
        <b-row>
          <b-col cols="2"></b-col>
          <b-col cols="2" align-self="end">비밀번호</b-col
          ><b-col cols="4" align-self="start" style="padding: 10px">{{
            user.password
          }}</b-col>
          <b-col cols="2"></b-col>
        </b-row>
        <b-row>
          <b-col cols="2"></b-col>
          <b-col cols="2" align-self="end">이름</b-col
          ><b-col cols="4" align-self="start" style="padding: 10px">{{
            user.name
          }}</b-col>
          <b-col cols="2"></b-col>
        </b-row>
        <b-row>
          <b-col cols="2"></b-col>
          <b-col cols="2" align-self="end">주소</b-col
          ><b-col cols="4" align-self="start" style="padding: 10px">{{
            user.address
          }}</b-col>
          <b-col cols="2"></b-col>
        </b-row>
        <b-row>
          <b-col cols="2"></b-col>
          <b-col cols="2" align-self="end">전화번호</b-col
          ><b-col cols="4" align-self="start" style="padding: 10px">{{
            user.number
          }}</b-col>
          <b-col cols="2"></b-col>
        </b-row>
      </b-container>
      <hr class="my-4" />
    </b-jumbotron>
    <b-row style="text-align: center">
      <b-col>
        <b-button variant="light" @click="moveModify">정보수정</b-button>
        <b-button variant="danger" @click="deleteUser">회원탈퇴</b-button>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { mapState } from "vuex";
import http from "@/api/http";

export default {
  name: "profileView",
  data() {
    return {
      user: {},
    };
  },
  computed: {
    ...mapState(["userid"]),
  },
  created() {
    http.get(`admin/user/${this.userid}`).then(({ data }) => {
      this.user = data;
    });
  },
  methods: {
    moveHome() {
      this.$router.push("/");
    },
    moveModify() {
      this.$router.replace({
        name: "mypageModify",
        params: { id: this.userid },
      });
    },
    deleteUser() {
      if (confirm("정말로 탈퇴하시겠습니까?")) {
        http.delete(`admin/user/${this.userid}`).then(({ data }) => {
          let msg = "탈퇴가 정상적으로 처리되었습니다.";
          if (data === "success") {
            msg = "탈퇴가 정상적으로 처리되었습니다.";
          }
          alert(msg);
          this.$store.dispatch("logout");
        });
      }
    },
  },
};
</script>

<style>
.underline-hotpink {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(199, 96, 152, 0.3) 30%
  );
}
</style>
