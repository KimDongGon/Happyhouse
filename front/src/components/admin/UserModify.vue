<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <h3 class="underline-hotpink">
          <b-icon icon="list"></b-icon> 회원수정
        </h3>
      </b-col>
    </b-row>
    <user-input-item type="modify" />
  </b-container>
</template>

<script>
import UserInputItem from "@/components/admin/item/UserInputItem.vue";

export default {
  name: "UserModify",
  components: {
    UserInputItem,
  },
};
</script>

<style></style>
