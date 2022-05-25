<template>
  <div class="container">
    <div id="map" class="mt-5 mb-5" style="width: 100%; height: 500px"></div>
  </div>
</template>

<script>
export default {
  name: "KakaoMap",
  data() {
    return {
      marker: null,
      map: null,
      imageSrc: require(`@/assets/marker.png`),
    };
  },
  props: ["latLng"],
  computed: {
    houseList() {
      return this.$store.getters["house/houseList"];
    },
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src = `//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=${process.env.VUE_APP_KAKAO_MAP_KEY}`;
      document.head.appendChild(script);
    }
  },
  methods: {
    initMap() {
      const container = document.getElementById("map");
      const options = {
        center: new kakao.maps.LatLng(37.60295171133499, 127.02282579840427),
        level: 3,
      };

      //지도 객체를 등록합니다.
      //지도 객체는 반응형 관리 대상이 아니므로 initMap에서 선언합니다.
      this.map = new kakao.maps.Map(container, options);
    },
    displayMarker(lat, lng) {
      // 기존에 존재하는 마커 제거
      if (this.marker !== null) {
        this.marker.setMap(null);
      }

      this.map.setCenter(new kakao.maps.LatLng(lat, lng));

      const marker = new kakao.maps.Marker({
        map: this.map,
        position: new kakao.maps.LatLng(lat, lng),
        image: new kakao.maps.MarkerImage(
          this.imageSrc,
          // eslint-disable-next-line prettier/prettier
          new kakao.maps.Size(40, 40)
        ),
      });
      // var iwContent = `<div style="padding:10px;">${info.aptName}</div>`, // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
      //   iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

      // // 인포윈도우를 생성합니다
      // var infowindow = new kakao.maps.InfoWindow({
      //   content: iwContent,
      //   removable: iwRemoveable,
      // });

      // kakao.maps.event.addListener(marker, "click", () => {
      //   //마커 position을 출력합니다.
      //   infowindow.open(this.map, marker);
      // });

      this.marker = marker;
    },
  },
};
</script>

<style></style>
