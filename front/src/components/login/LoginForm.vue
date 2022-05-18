<template>
  <div class="container">
    <b-form @submit.stop.prevent>
      <label for="feedback-user">아이디</label>
      <b-form-input
        v-model="userId"
        :state="idValidation"
        id="feedback-user"
      ></b-form-input>
      <b-form-invalid-feedback :state="idValidation">
        아이디는 5자이상 16자이하입니다.
      </b-form-invalid-feedback>

      <label for="text-password">비밀번호</label>
      <b-form-input
        type="password"
        :state="passValidation"
        v-model="userpass"
        id="text-password"
        aria-describedby="password-help-block"
      ></b-form-input>
      <b-form-invalid-feedback :state="passValidation">
        패스워드는 1자이상이어야 합니다.
      </b-form-invalid-feedback>

      <b-button variant="primary" @click="login">로그인</b-button>
    </b-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userId: "",
      userpass: "",
    };
  },
  computed: {
    idValidation() {
      return this.userId.length >= 5 && this.userId.length <= 16;
    },
    passValidation() {
      return this.userpass.length >= 1;
    },
  },
  methods: {
    login() {
      if (this.idValidation && this.passValidation) {
        const user = {
          id: this.userId,
          password: this.userpass,
        };

        this.$store.dispatch("loginUser", user);
      }
    },
  },
};
</script>

<style scoped>
button {
  margin-top: 20px;
}
</style>
