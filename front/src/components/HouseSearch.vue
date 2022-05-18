<template>
  <div class="bg-dark wrapper">
    <div class="container">
      <b-row>
        <b-col>
          <b-form-select
            v-model="sidoCode"
            :options="sido"
            @change="sidoChanged"
            class="bg-dark text-light"
          ></b-form-select>
        </b-col>
        <b-col>
          <b-form-select
            v-model="gugunCode"
            :options="gugun"
            @change="gugunChanged"
            class="bg-dark text-light"
          ></b-form-select>
        </b-col>
        <b-col>
          <b-form-select
            v-model="dongCode"
            :options="dong"
            @change="dongChanged"
            class="bg-dark text-light"
          ></b-form-select>
        </b-col>

        <b-col class="text-center" cols="1">
          <b-button variant="primary" @click="search">검색</b-button>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
export default {
  data() {
    return {
      sidoCode: null,
      gugunCode: null,
      dongCode: null,
    };
  },
  computed: {
    ...mapState(["sido", "gugun", "dong"]),
  },
  created() {
    this.sidoCode = this.$store.state.sidoCode;
    this.gugunCode = this.$store.state.gugunCode;
    this.dongCode = this.$store.state.dongCode;
    this.getSido();
  },
  methods: {
    ...mapActions(["getSido", "getGugun", "getDong"]),
    ...mapMutations(["SET_SIDO_CODE", "SET_GUGUN_CODE", "SET_DONG_CODE"]),
    sidoChanged() {
      this.SET_SIDO_CODE(this.sidoCode);

      this.gugunCode = null;
      this.dongCode = null;
      this.SET_GUGUN_CODE(null);
      this.SET_DONG_CODE(null);
      if (this.sidoCode !== null) {
        this.getGugun(this.sidoCode);
      }
    },
    gugunChanged() {
      this.SET_GUGUN_CODE(this.gugunCode);

      this.dongCode = null;
      this.SET_DONG_CODE(null);
      if (this.gugunCode !== null) {
        this.getDong({ sidoCode: this.sidoCode, gugunCode: this.gugunCode });
      }
    },
    dongChanged() {
      this.SET_DONG_CODE(this.dongCode);
    },
    search() {
      if (this.sidoCode === null) {
        alert("시/도를 선택해주세요.");
      } else if (this.gugunCode === null) {
        alert("구/군을 선택해주세요.");
      } else if (this.dongCode === null) {
        alert("동을 선택해주세요.");
      } else {
        this.$router.push({
          name: "search",
          params: {
            sidoCode: this.sidoCode,
            gugunCode: this.gugunCode,
            dongCode: this.dongCode,
          },
        });
      }
    },
  },
};
</script>

<style scoped>
.wrapper {
  height: 75px;
  line-height: 75px;
  text-align: center;
  justify-content: center;
}
select {
  width: 100%;
  height: 65%;
  border-radius: 7px;
}
button {
  height: 60%;
  margin-bottom: 7px;
}
.col {
}
</style>
