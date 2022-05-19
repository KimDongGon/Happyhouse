<template>
  <div>
    <house-search />
    <kakao-map />
    <home-article />
  </div>
</template>

<script>
import HomeArticle from "@/components/home/HomeArticle.vue";
import KakaoMap from "@/components/KakaoMap.vue";
import HouseSearch from "@/components/House/HouseSearch.vue";

export default {
  name: "HomeView",
  components: {
    HomeArticle,
    KakaoMap,
    HouseSearch,
  },
};
</script>
