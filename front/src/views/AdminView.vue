<template>
  <b-container class="bv-example-row mt-3 text-center">
    <router-view></router-view>
  </b-container>
</template>
<script>
export default {
  name: "adminView",
};
</script>
<style>
.underline-hotpink {
  display: inline-block;
  background: linear-gradient(
    180deg,
    rgba(255, 255, 255, 0) 70%,
    rgba(199, 96, 152, 0.3) 30%
  );
}
</style>
