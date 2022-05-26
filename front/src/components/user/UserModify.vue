<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <h3 class="underline-hotpink">
          <b-icon icon="pencil-fill"></b-icon> 내정보수정
        </h3>
      </b-col>
    </b-row>

    <b-row class="mb-1">
      <b-col style="text-align: left">
        <b-form @submit="onSubmit">
          <b-form-group id="id-group" label="아이디:" label-for="id">
            <b-form-input
              id="id"
              ref="id"
              v-model="user.id"
              type="text"
              required
              readonly="readonly"
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
              placeholder="PASSWORD..."
            ></b-form-input>
          </b-form-group>

          <b-form-group id="name-group" label="이름:" label-for="name">
            <b-form-input
              id="name"
              ref="name"
              type="text"
              v-model="user.name"
              readonly="readonly"
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
          <b-button type="submit" variant="primary" class="m-1"
            >회원수정</b-button
          >
          <b-button variant="outline-primary" @click="moveList" class="m-1"
            >목록</b-button
          >
        </b-form>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import { mapActions, mapState } from "vuex";

export default {
  name: "mypageModify",
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
  computed: {
    ...mapState("user", ["userid", "username", "useraddress", "usermobile"]),
  },
  created() {
    this.user.id = this.userid;
    this.user.name = this.username;
    this.user.address = this.useraddress;
    this.user.number = this.usermobile;
  },
  methods: {
    ...mapActions("user", ["modifyUserInfo"]),
    onSubmit(event) {
      event.preventDefault();

      let err = true;
      let msg = "";
      !this.user.id &&
        ((msg = "아이디를 입력해주세요"), (err = false), this.$refs.id.focus());
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

      const userInfo = {
        id: this.user.id,
        passwrd: this.user.password === "" ? null : this.user.password,
        name: this.user.name,
        address: this.user.address,
        number: this.user.number,
      };

      this.modifyUserInfo(userInfo);
    },
    moveList() {
      this.$router.push({ name: "mypage" });
    },
  },
};
</script>

<style></style>
