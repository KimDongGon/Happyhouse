<template>
  <div id="app">
    <main-header />
    <router-view />
    <main-footer />
  </div>
</template>

<script>
import MainHeader from "@/components/common/MainHeader.vue";
import MainFooter from "@/components/common/MainFooter.vue";

export default {
  name: "App",
  components: {
    MainHeader,
    MainFooter,
  },
};
</script>

<style>
#app {
  position: relative;
  min-height: 100%;
  padding-bottom: 170px;
}
html,
body {
  height: 100%;
}

a {
  text-decoration: none;
}
</style>
