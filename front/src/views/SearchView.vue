<template>
  <div>
    <house-search />
    <b-row class="container-fluid">
      <b-col>
        <house-search-list />
      </b-col>
      <b-col>
        <kakao-map />
      </b-col>
    </b-row>
  </div>
</template>

<script>
import HouseSearch from "@/components/House/HouseSearch.vue";
import HouseSearchList from "@/components/House/HouseSearchList.vue";
import KakaoMap from "@/components/KakaoMap.vue";
export default {
  name: "searchView",
  components: { HouseSearch, HouseSearchList, KakaoMap },
};
</script>

<style></style>
