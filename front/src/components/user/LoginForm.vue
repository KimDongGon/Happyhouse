<template>
  <div class="container d-flex justify-content-center mt-5">
    <div class="bg-light rounded shadow ps-3 pe-3 w-50">
      <h1 class="mt-3">로그인</h1>
      <b-form @submit.stop.prevent="onSubmit">
        <b-form-group
          label="아이디"
          label-size="lg"
          label-for="userId"
          class="mt-3"
        >
          <b-form-input
            class="form-control-lg rounded-0"
            id="userId"
            placeholder="아이디"
            v-model="$v.form.userId.$model"
            :state="validateState('userId')"
            aria-describedby="idFeedback"
          />

          <b-form-invalid-feedback id="idFeedback"
            >아이디는 5자이상 20자이하여야 합니다.</b-form-invalid-feedback
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
            aria-describedby="passwordFeedback"
          />
          <b-form-invalid-feedback id="passwordFeedback"
            >비밀번호는 5자이상 20자이하여야 합니다.</b-form-invalid-feedback
          >
        </b-form-group>

        <b-button type="submit" variant="primary" class="mt-3 mb-3"
          >로그인</b-button
        >
        <!-- <b-button variant="primary" @click="login">로그인</b-button> -->
      </b-form>
    </div>
  </div>
</template>

<script>
import { validationMixin } from "vuelidate";
import {
  required,
  minLength,
  maxLength,
  alphaNum,
} from "vuelidate/lib/validators";

export default {
  mixins: [validationMixin],
  data() {
    return {
      form: {
        userId: null,
        userPassword: null,
      },
    };
  },
  validations: {
    form: {
      userId: {
        required,
        minLength: minLength(5),
        maxLength: maxLength(20),
        alphaNum,
      },
      userPassword: {
        required,
        minLength: minLength(5),
        maxLength: maxLength(20),
      },
    },
  },
  methods: {
    validateState(name) {
      const { $dirty, $error } = this.$v.form[name];
      return $dirty ? !$error : null;
    },

    onSubmit() {
      this.$v.form.$touch();
      if (this.$v.form.$anyError) {
        return;
      }

      const user = {
        id: this.form.userId,
        password: this.form.userPassword,
      };

      this.$store.dispatch("loginUser", user);
    },
  },
};
</script>

<style scoped>
button {
  margin-top: 20px;
}
</style>
