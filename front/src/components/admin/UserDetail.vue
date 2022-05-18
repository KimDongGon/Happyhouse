<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <h3 class="underline-hotpink">
          <b-icon icon="journals"></b-icon> 회원상세조회
        </h3>
      </b-col>
    </b-row>
    <b-col class="text-align: left">
      <b-button variant="outline-primary" @click="listUser">목록</b-button>
    </b-col>
    <b-row class="mb-1">
      <b-col style="text-align: left">
        <b-form @submit="onSubmit" @reset="onReset">
          <b-form-group id="id-group" label="아이디:" label-for="id">
            <b-form-input id="id" type="text" readonly="readonly">{{
              user.id
            }}</b-form-input>
          </b-form-group>

          <b-form-group
            id="password-group"
            label="비밀번호:"
            label-for="password"
          >
            <b-form-input id="password" type="text" readonly="readonly">{{
              user.password
            }}</b-form-input>
          </b-form-group>

          <b-form-group id="name-group" label="이름:" label-for="name">
            <b-form-input id="name" type="text" readonly="readonly">{{
              user.name
            }}</b-form-input>
          </b-form-group>

          <b-form-group id="address-group" label="주소:" label-for="address">
            <b-form-input id="address" type="text" readonly="readonly">{{
              user.address
            }}</b-form-input>
          </b-form-group>

          <b-form-group id="number-group" label="전화번호:" label-for="number">
            <b-form-input id="number" type="text" readonly="readonly">{{
              user.number
            }}</b-form-input>
          </b-form-group>
          <b-button type="submit" variant="primary" class="m-1">수정</b-button>
          <b-button type="reset" variant="danger" class="m-1">삭제</b-button>
        </b-form>
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

<style></style>
