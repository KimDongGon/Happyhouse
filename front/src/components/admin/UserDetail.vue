<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <h3 class="underline-hotpink">
          <b-icon icon="journals"></b-icon> 회원상세조회
        </h3>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-left">
        <b-button variant="outline-primary" @click="listUser">목록</b-button>
      </b-col>
      <b-col class="text-right">
        <b-button
          variant="outline-info"
          size="sm"
          @click="moveModifyUser"
          class="mr-2"
          >수정</b-button
        >
        <b-button variant="outline-danger" size="sm" @click="deleteUser"
          >삭제</b-button
        >
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col>
        <b-tale-simple hover responsive>
          <b-tr>
            <b-th>아이디</b-th>
            <b-td>{{ user.id }}</b-td>
          </b-tr>
          <b-tr>
            <b-th>비밀번호</b-th>
            <b-td>{{ user.password }}</b-td>
          </b-tr>
          <b-tr>
            <b-th>이름</b-th>
            <b-td>{{ user.name }}</b-td>
          </b-tr>
          <b-tr>
            <b-th>주소</b-th>
            <b-td>{{ user.address }}</b-td>
          </b-tr>
          <b-tr>
            <b-th>전화번호</b-th>
            <b-td>{{ user.number }}</b-td>
          </b-tr>
        </b-tale-simple>
      </b-col>
    </b-row>
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
