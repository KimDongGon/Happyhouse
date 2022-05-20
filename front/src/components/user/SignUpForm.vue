<template>
  <div class="container d-flex justify-content-center mt-5">
    <div class="bg-light rounded shadow ps-3 pe-3 w-50">
      <h1 class="mt-3">회원가입</h1>
      <b-form @submit.stop.prevent="onSubmit">
        <b-form-group
          label="아이디"
          label-size="lg"
          label-for="userId"
          class="mt-5"
        >
          <b-form-input
            class="form-control-lg rounded-0"
            id="userId"
            placeholder="아이디"
            v-model="$v.form.userId.$model"
            :state="validateState('userId')"
            aria-describedby="id_feedback test"
          />

          <b-form-invalid-feedback
            id="!id_feedback"
            v-show="!$v.form.userId.isUnique"
            >중복되는 아이디가 존재합니다.</b-form-invalid-feedback
          >
        </b-form-group>

        <b-form-group
          label="비밀번호"
          label-size="lg"
          label-for="userPassword"
          class="mt-1"
        >
          <b-form-input
            type="password"
            class="form-control-lg rounded-0"
            id="userPassword"
            placeholder="비밀번호"
            v-model="$v.form.userPassword.$model"
            :state="validateState('userPassword')"
          />
        </b-form-group>

        <b-form-group
          label="비밀번호 확인"
          label-size="lg"
          label-for="userPasswordCheck"
          class="mt-1"
        >
          <b-form-input
            type="password"
            class="form-control-lg rounded-0"
            id="userPasswordCheck"
            placeholder="비밀번호를 한 번 더 입력해주세요."
            v-model="$v.form.userPasswordCheck.$model"
            :state="validateState('userPasswordCheck')"
          />
        </b-form-group>

        <b-form-group
          label="이름"
          label-size="lg"
          label-for="name"
          class="mt-1"
        >
          <b-form-input
            type="text"
            class="form-control-lg rounded-0"
            id="name"
            placeholder="이름"
            v-model="$v.form.userName.$model"
            :state="validateState('userName')"
          />
        </b-form-group>

        <b-form-group
          label="주소"
          label-size="lg"
          label-for="userAddress"
          class="mt-1"
        >
          <b-form-input
            type="text"
            class="form-control-lg rounded-0"
            id="userAddress"
            placeholder="주소"
            v-model="$v.form.userAddress.$model"
            :state="validateState('userAddress')"
          />
        </b-form-group>

        <b-form-group
          label="휴대폰 번호"
          label-size="lg"
          label-for="userMobile"
          class="mt-1"
        >
          <b-form-input
            type="text"
            class="form-control-lg rounded-0"
            id="userMobile"
            placeholder="휴대폰 번호"
            v-model="$v.form.userMobile.$model"
            :state="validateState('userMobile')"
          />
        </b-form-group>

        <b-button type="submit" variant="primary" class="mt-3 mb-3"
          >회원가입</b-button
        >
      </b-form>
    </div>
  </div>
</template>

<script>
import { validationMixin } from "vuelidate";
import { required, minLength, maxLength } from "vuelidate/lib/validators";
import { mapActions } from "vuex";
import http from "@/api/http.js";

export default {
  mixins: [validationMixin],
  data() {
    return {
      isOverlap: false,
      form: {
        userId: null,
        userPassword: null,
        userPasswordCheck: null,
        userName: null,
        userAddress: null,
        userMobile: null,
      },
    };
  },
  validations: {
    form: {
      userId: {
        required,
        minLength: minLength(5),
        maxLength: maxLength(20),
        isUnique(value) {
          if (value === "") return true;
          return http
            .get("/user/idcheck", { params: { ckid: value } })
            .then((res) => {
              if (res.status === 200) {
                // this.isOverlap = true;
                return true;
              }
            })
            .catch((err) => console.log(err));
        },
      },
      userPassword: {
        required,
        minLength: minLength(5),
        maxLength: maxLength(20),
      },
      userPasswordCheck: {
        required,
        minLength: minLength(5),
        maxLength: maxLength(20),
      },
      userName: {
        required,
        minLength: minLength(1),
        maxLength: maxLength(20),
      },
      userAddress: {
        required,
        minLength: minLength(5),
        maxLength: maxLength(45),
      },
      userMobile: {
        required,
        minLength: minLength(10),
        maxLength: maxLength(14),
      },
    },
  },
  methods: {
    ...mapActions(["signUp"]),

    validateState(name) {
      const { $dirty, $error } = this.$v.form[name];
      return $dirty ? !$error : null;
    },
    onSubmit() {
      this.$v.form.$touch();
      if (this.$v.form.$anyError) {
        return;
      }

      this.signUp(this.form);
    },
    idCheck() {
      if (this.idLengthValidation) {
        http
          .get("/user/idcheck", { params: { ckid: this.form.userId } })
          .then((res) => {
            if (res.status === 200) {
              this.isOverlap = true;
            }
          })
          .catch((err) => console.log(err));
      }
    },
  },
};
</script>

<style scoped>
h1 {
  font-weight: bold;
}
</style>
