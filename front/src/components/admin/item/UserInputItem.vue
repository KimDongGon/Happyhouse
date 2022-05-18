<template>
  <b-row class="mb-1">
    <b-col style="text-align: left">
      <b-form @submit="onSubmit" @reset="onReset">
        <b-form-group id="id-group" label="아이디:" label-for="id">
          <b-form-input
            id="id"
            ref="id"
            v-model="user.id"
            type="text"
            required
            placeholder="ID.."
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="password-group"
          label="비밀번호:"
          label-for="password"
        >
          <b-form-input
            id="password"
            ref="password"
            v-model="user.password"
            type="text"
            required
            placeholder="PASSWORD..."
          ></b-form-input>
        </b-form-group>

        <b-form-group id="name-group" label="이름:" label-for="name">
          <b-form-input
            id="name"
            ref="name"
            type="text"
            v-model="user.name"
            placeholder="NAME..."
          ></b-form-input>
        </b-form-group>

        <b-form-group id="address-group" label="주소:" label-for="address">
          <b-form-input
            id="address"
            ref="address"
            v-model="user.address"
            type="text"
            required
            placeholder="ADDRESS..."
          ></b-form-input>
        </b-form-group>

        <b-form-group id="number-group" label="전화번호:" label-for="number">
          <b-form-input
            id="number"
            ref="number"
            v-model="user.number"
            type="text"
            required
            placeholder="NUMBER..."
          ></b-form-input>
        </b-form-group>
        <b-button
          type="submit"
          variant="primary"
          class="m-1"
          v-if="this.type === 'register'"
          >회원등록</b-button
        >
        <b-button type="submit" variant="primary" class="m-1" v-else
          >회원수정</b-button
        >
        <b-button type="reset" variant="danger" class="m-1">초기화</b-button>
      </b-form>
    </b-col>
  </b-row>
</template>

<script>
import http from "@/api/http";

export default {
  name: "UserInputItem",
  data() {
    return {
      user: {
        id: "",
        password: "",
        name: "",
        address: "",
        number: "",
      },
    };
  },
  props: {
    type: { type: String },
  },
  created() {
    if (this.type === "modify") {
      http.get(`/admin/user/${this.$route.params.id}`).then(({ data }) => {
        this.user = data;
      });
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();

      let err = true;
      let msg = "";
      !this.user.id &&
        ((msg = "아이디를 입력해주세요"), (err = false), this.$refs.id.focus());
      err &&
        !this.user.password &&
        ((msg = "비밀번호를 입력해주세요"),
        (err = false),
        this.$refs.password.focus());
      err &&
        !this.user.name &&
        ((msg = "이름을 입력해주세요"), (err = false), this.$refs.name.focus());
      err &&
        !this.user.address &&
        ((msg = "주소를 입력해주세요"),
        (err = false),
        this.$refs.address.focus());
      err &&
        !this.user.number &&
        ((msg = "전화번호를 입력해주세요"),
        (err = false),
        this.$refs.number.focus());

      if (!err) alert(msg);
      else this.type === "register" ? this.registUser() : this.modifyUser();
    },
    onReset(event) {
      event.preventDefault();
      this.user.id = "";
      this.user.password = "";
      this.user.name = "";
      this.user.address = "";
      this.user.number = "";
      this.$router.push({ name: "userList" });
    },
    registUser() {
      http
        .post(`/admin/user`, {
          id: this.user.id,
          password: this.user.password,
          name: this.user.name,
          address: this.user.address,
          number: this.user.number,
        })
        .then(({ data }) => {
          let msg = "등록이 완료되었습니다..";
          if (data === "success") {
            msg = "등록이 완료되었습니다.";
          }
          alert(msg);
          this.moveList();
        });
    },
    modifyUser() {
      http
        .put(`/admin/user/${this.user.id}`, {
          id: this.user.id,
          password: this.user.password,
          name: this.user.name,
          address: this.user.address,
          number: this.user.number,
        })
        .then(({ data }) => {
          let msg = "수정 처리시 문제가 발생했습니다.";
          if (data === "success") {
            msg = "수정이 완료되었습니다.";
          }
          alert(msg);
          // 현재 route를 /list로 변경.
          this.$router.push({ name: "userList" });
        });
    },
    moveList() {
      this.$router.push({ name: "userList" });
    },
  },
};
</script>

<style></style>
