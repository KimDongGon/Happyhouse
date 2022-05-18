<template>
  <div>
    <apt-search />
    <kakao-map />
    <home-article />
  </div>
</template>

<script>
import HomeArticle from "@/components/home/HomeArticle.vue";
import KakaoMap from "@/components/KakaoMap.vue";
import AptSearch from "@/components/AptSearch.vue";

export default {
  name: "HomeView",
  components: {
    HomeArticle,
    KakaoMap,
    AptSearch,
  },
};
</script>
