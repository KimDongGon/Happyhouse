<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <h3 class="underline-hotpink">
          <b-icon icon="journals"></b-icon> 회원상세조회
        </h3>
      </b-col>
    </b-row>
    <hr class="my-4" />
    <b-row class="mb-1">
      <b-col class="text-left">
        <b-button variant="outline-primary" @click="listUser">목록</b-button>
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
      <b-button variant="primary" href="#" class="mr-1" @click="moveModifyUser"
        >정보수정</b-button
      >
      <b-button variant="danger" href="#" @click="deleteUser"
        >회원탈퇴</b-button
      >
    </b-jumbotron>
  </b-container>
</template>

<script>
import http from "@/api/http";

export default {
  name: "UserDetail",
  data() {
    return {
      user: {},
    };
  },
  computed: {},
  created() {
    http.get(`/admin/user/${this.$route.params.id}`).then(({ data }) => {
      this.user = data;
    });
  },
  methods: {
    listUser() {
      this.$router.push({ name: "admin" });
    },
    moveModifyUser() {
      this.$router.replace({
        name: "userModify",
        params: { id: this.user.id },
      });
    },
    deleteUser() {
      if (confirm("정말로 회원을 탈퇴시키겠습니까?")) {
        this.$router.replace({
          name: "userDelete",
          params: { id: this.user.id },
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

<style scoped>
.tdClass {
  width: 50px;
  text-align: center;
}
.tdSubject {
  width: 300px;
  text-align: left;
}
</style>
