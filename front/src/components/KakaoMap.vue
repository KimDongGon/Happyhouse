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
      markers: [],
      positions: [
        {
          title: "돈암삼부아파트",
          latlng: new kakao.maps.LatLng(37.602874980485815, 127.024074908179),
        },
        {
          title: "돈암동부센트레빌아파트",
          latlng: new kakao.maps.LatLng(37.60277610066754, 127.0259693355823),
        },
        {
          title: "돈암현대아파트",
          latlng: new kakao.maps.LatLng(37.60374078756766, 127.0271420873093),
        },
        {
          title: "돈암범양아파트",
          latlng: new kakao.maps.LatLng(37.603392290108424, 127.02795747887419),
        },
        {
          title: "길음뉴타운9단지아파트",
          latlng: new kakao.maps.LatLng(37.60295247998547, 127.02021965472383),
        },
      ],
      infowindow: null,
    };
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
      this.initMarker();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=e2b44d4461fe733e0c8e660ed7d2663b";
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
    initMarker() {
      const imageSrc =
        "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

      if (this.positions.length > 0) {
        this.markers = this.positions.map((position) => {
          new kakao.maps.Marker({
            map: this.map,
            position: position.latlng,
            title: position.title,
            image: new kakao.maps.MarkerImage(
              imageSrc,
              // eslint-disable-next-line prettier/prettier
              new kakao.maps.Size(24, 35)
            ),
          });
        });

        if (this.markers.length > 0) {
          this.markers.forEach((marker) => marker.setMap(null));
        }
      }
    },
  },
};
</script>

<style></style>
