<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show
          ><h3><b-icon icon="question-circle-fill"></b-icon> QnA</h3></b-alert
        >
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-aligh : end">
        <b-button variant="outline-primary" @click="moveList()">목록</b-button>
      </b-col>
    </b-row>
    <qna-input-item type="register" />
  </b-container>
</template>

<script>
import QnaInputItem from "@/components/qna/item/QnaInputItem";

export default {
  name: "QnaRegister",
  components: {
    QnaInputItem,
  },
  methods: {
    moveList() {
      this.$router.push({ name: "qnaList" });
    },
  },
};
</script>

<style></style>
