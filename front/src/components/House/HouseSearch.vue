<template>
  <div class="bg-dark wrapper">
    <div class="container">
      <b-row>
        <b-col>
          <b-form-select
            v-model="sidoName"
            :options="sido"
            @change="sidoChanged"
            class="bg-dark text-light"
            :disabled="disabled"
          ></b-form-select>
        </b-col>
        <b-col>
          <b-form-select
            v-model="gugunName"
            :options="gugun"
            @change="gugunChanged"
            class="bg-dark text-light"
            :disabled="disabled"
          ></b-form-select>
        </b-col>
        <b-col>
          <b-form-select
            v-model="dongCode"
            :options="dong"
            @change="dongChanged"
            class="bg-dark text-light"
            :disabled="disabled"
          ></b-form-select>
        </b-col>

        <b-col class="text-center" cols="1">
          <b-button variant="primary" @click="search" v-if="!disabled"
            >검색</b-button
          >
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
export default {
  props: {
    disabled: Boolean,
  },
  data() {
    return {
      sidoName: null,
      gugunName: null,
      dongCode: null,
    };
  },
  computed: {
    ...mapState("code", ["sido", "gugun", "dong"]),
  },
  created() {
    this.sidoName = this.$store.state.code.sidoName;
    this.gugunName = this.$store.state.code.gugunName;
    this.dongCode = this.$store.state.code.dongCode;
    if (this.sido.length === 1) {
      this.getSido();
    }
  },
  methods: {
    ...mapActions("code", [
      "getSido",
      "getGugun",
      "getDong",
      "setSidoName",
      "setGugunName",
      "setDongCode",
      "initGugun",
      "initDong",
    ]),
    sidoChanged() {
      this.setSidoName(this.sidoName);

      this.gugunName = null;
      this.dongCode = null;
      this.setGugunName(null);
      this.setDongCode(null);
      this.initGugun();
      this.initDong();

      if (this.sidoName !== null) {
        this.getGugun(this.sidoName);
      }
    },
    gugunChanged() {
      this.setGugunName(this.gugunName);

      this.dongCode = null;
      this.setDongCode(null);
      this.initDong();

      if (this.gugunName !== null) {
        this.getDong({ sidoName: this.sidoName, gugunName: this.gugunName });
      }
    },
    dongChanged() {
      this.setDongCode(this.dongCode);
    },
    search() {
      if (this.sidoName === null) {
        alert("시/도를 선택해주세요.");
      } else if (this.gugunName === null) {
        alert("구/군을 선택해주세요.");
      } else if (this.dongCode === null) {
        alert("동을 선택해주세요.");
      } else {
        this.$router.push({
          name: "search",
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
