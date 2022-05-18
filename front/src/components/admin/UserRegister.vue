<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <h3 class="underline-hotpink">
          <b-icon icon="journals"></b-icon> 회원등록
        </h3>
      </b-col>
    </b-row>
    <b-col class="text-align: left">
      <b-button variant="outline-primary" @click="listUser">목록</b-button>
    </b-col>
    <user-input-item type="register" />
  </b-container>
</template>

<script>
import UserInputItem from "@/components/admin/item/UserInputItem";

export default {
  name: "userRegister",
  components: {
    UserInputItem,
  },
  methods: {
    listUser() {
      this.$router.push({ name: "admin" });
    },
  },
};
</script>

<style></style>
