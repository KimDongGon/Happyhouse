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
      markerInfos: [
        {
          position: [37.602874980485815, 127.024074908179],
          text: "돈암삼부아파트",
        },
        {
          position: [37.60277610066754, 127.0259693355823],
          text: "돈암동부센트레빌아파트",
        },
        {
          position: [37.60374078756766, 127.0271420873093],
          text: "돈암현대아파트",
        },
        {
          position: [37.603392290108424, 127.02795747887419],
          text: "돈암범양아파트",
        },
        {
          position: [37.60295247998547, 127.02021965472383],
          text: "길음뉴타운9단지아파트",
        },
      ],
    };
  },
  mounted() {
    if (window.kakao && window.kakao.maps) {
      this.initMap();
    } else {
      const script = document.createElement("script");
      /* global kakao */
      script.onload = () => kakao.maps.load(this.initMap);
      script.src =
        "//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=915cffed372954b7b44804ed422b9cf0";
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

      this.initMarker();
    },
    initMarker() {
      if (this.markers.length > 0) {
        this.markers.forEach((marker) => marker.setMap(null));
      }

      const imageSrc = require(`@/assets/marker.png`);

      const infos = this.markerInfos.map((info) => ({
        position: new kakao.maps.LatLng(...info.position),
        text: info.text,
      }));

      if (infos.length > 0) {
        this.markers = infos.map((info) => {
          const marker = new kakao.maps.Marker({
            map: this.map,
            position: info.position,
            image: new kakao.maps.MarkerImage(
              imageSrc,
              // eslint-disable-next-line prettier/prettier
              new kakao.maps.Size(40, 40)
            ),
          });
          var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

          // 인포윈도우를 생성합니다
          var infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: iwRemoveable,
          });

          kakao.maps.event.addListener(marker, "click", () => {
            //마커 position을 출력합니다.
            infowindow.open(this.map, marker);
          });

          return marker;
        });
      }
    },
  },
};
</script>

<style></style>
