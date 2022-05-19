<template>
  <div class="container d-flex justify-content-center mt-5">
    <div class="bg-light rounded shadow ps-3 pe-3 w-50">
      <h3 class="mt-3">회원가입</h3>
      <b-form @submit.stop.prevent>
        <b-form-group>
          <b-form-input
            type="email"
            class="form-control-lg rounded-0"
            id="id"
            placeholder="아이디"
            v-model="form.userId"
          />
        </b-form-group>
        <b-form-valid-feedback> </b-form-valid-feedback>
        <b-form-group>
          <b-form-input
            type="password"
            class="form-control-lg border-top-0 rounded-0"
            id="password"
            placeholder="비밀번호"
            v-model="form.userPassword"
          />
        </b-form-group>
        <b-form-group>
          <b-form-input
            type="password"
            class="form-control-lg border-top-0 rounded-0"
            id="passwordCheck"
            placeholder="비밀번호 확인"
            v-model="form.userPasswordCheck"
          />
        </b-form-group>
        <div class="form-group mt-3">
          <b-form-input
            type="email"
            class="form-control-lg rounded-0"
            id="name"
            placeholder="이름"
            v-model="form.userName"
          />
        </div>
        <b-form-group>
          <b-form-input
            type="email"
            class="form-control-lg border-top-0 rounded-0"
            id="address"
            placeholder="주소"
            v-model="form.userAddress"
          />
        </b-form-group>
        <div class="form-group mt-3">
          <b-form-input
            type="email"
            class="form-control-lg rounded-0"
            id="mobile"
            placeholder="휴대폰 번호"
            v-model="form.userMobile"
          />
        </div>
        <b-button variant="primary" class="mt-3 mb-3" @click="signup">
          회원가입
        </b-button>
      </b-form>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
export default {
  name: "SignUpForm",
  data() {
    return {
      form: {
        userId: "",
        userPassword: "",
        userPasswordCheck: "",
        userName: "",
        userAddress: "",
        userMobile: "",
      },
    };
  },
  methods: {
    ...mapActions(["signUp"]),
    signup() {
      this.signUp(this.form);
    },
  },
};
</script>

<style></style>
