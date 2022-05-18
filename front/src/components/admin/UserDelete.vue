<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <h3 class="underline-hotpink">
          <b-icon icon="list"></b-icon> 회원목록
        </h3>
      </b-col>
    </b-row>
    <b-row>
      <b-col><b-alert show variant="danger">삭제처리중...</b-alert></b-col>
    </b-row>
  </b-container>
</template>

<script>
import http from "@/api/http";

export default {
  name: "UserDelete",
  created() {
    http.delete(`/admin/user/${this.$route.params.id}`).then(({ data }) => {
      let msg = "삭제가 완료되었습니다.";
      if (data === "success") {
        msg = "삭제가 완료되었습니다.";
      }
      alert(msg);
      // 현재 route를 /list로 변경.
      this.$router.push({ name: "userList" });
    });
  },
};
</script>

<style></style>
