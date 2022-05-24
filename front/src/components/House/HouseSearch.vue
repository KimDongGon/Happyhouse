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
            :disabled="disabled"
          ></b-form-select>
        </b-col>
        <b-col>
          <b-form-select
            v-model="gugunCode"
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
      sidoCode: null,
      gugunCode: null,
      dongCode: null,
    };
  },
  computed: {
    ...mapState("code", ["sido", "gugun", "dong"]),
  },
  created() {
    this.sidoCode = this.$store.state.code.sidoCode;
    this.gugunCode = this.$store.state.code.gugunCode;
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
      "setSidoCode",
      "setGugunCode",
      "setDongCode",
    ]),
    sidoChanged() {
      this.setSidoCode(this.sidoCode);

      this.gugunCode = null;
      this.dongCode = null;
      this.setGugunCode(null);
      this.setDongCode(null);
      if (this.sidoCode !== null) {
        this.getGugun(this.sidoCode);
      }
    },
    gugunChanged() {
      this.setGugunCode(this.gugunCode);

      this.dongCode = null;
      this.setDongCode(null);
      if (this.gugunCode !== null) {
        this.getDong({ sidoCode: this.sidoCode, gugunCode: this.gugunCode });
      }
    },
    dongChanged() {
      this.setDongCode(this.dongCode);
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
