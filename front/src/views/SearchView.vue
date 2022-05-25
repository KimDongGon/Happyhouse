<template>
  <div>
    <house-search :disabled="true" />
    <div class="container">
      <b-row>
        <b-col>
          <house-search-list
            @setLatlng="setLatlng"
            @searchApartmentName="searchApartmentName"
          />
          <house-page-link ref="pageLink" />
        </b-col>
        <b-col>
          <kakao-map ref="kakaoMap" />
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
import HouseSearch from "@/components/House/HouseSearch.vue";
import HouseSearchList from "@/components/House/HouseSearchList.vue";
import KakaoMap from "@/components/KakaoMap.vue";
import HousePageLink from "@/components/House/HousePageLink.vue";
import { mapActions } from "vuex";

export default {
  name: "searchView",
  components: { HouseSearch, HouseSearchList, KakaoMap, HousePageLink },
  methods: {
    ...mapActions("house", ["initHouseList"]),
    setLatlng({ lat, lng }) {
      this.$refs.kakaoMap.displayMarker(lat, lng);
    },
    searchApartmentName({ page, apartmentName }) {
      this.$refs.pageLink.setApartmentName(apartmentName);
      this.$refs.pageLink.movePage(page);
    },
  },
  destroyed() {
    this.initHouseList();
  },
};
</script>

<style></style>
