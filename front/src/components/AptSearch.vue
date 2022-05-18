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
import { mapState, mapActions } from "vuex";
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
    this.getSido();
  },
  methods: {
    ...mapActions(["getSido", "getGugun", "getDong"]),
    sidoChanged() {
      this.gugunCode = null;
      this.dongCode = null;
      if (this.sidoCode !== null) {
        this.getGugun(this.sidoCode);
      }
    },
    gugunChanged() {
      this.dongCode = null;
      if (this.gugunCode !== null) {
        this.getDong({ sidoCode: this.sidoCode, gugunCode: this.gugunCode });
      }
    },
    search() {},
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
