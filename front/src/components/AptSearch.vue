<template>
  <div class="bg-dark wrapper">
    <div class="container">
      <b-row>
        <b-col>
          <b-form-select
            v-model="selected"
            :options="options"
            class="bg-dark text-light"
          ></b-form-select>
        </b-col>
        <b-col>
          <b-form-select
            v-model="selected"
            :options="options"
            class="bg-dark text-light"
          ></b-form-select>
        </b-col>
        <b-col>
          <b-form-select
            v-model="selected"
            :options="options"
            class="bg-dark text-light"
          ></b-form-select>
        </b-col>

        <b-col class="text-center" cols="1">
          <b-button variant="primary">검색</b-button>
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selected: null,
      options: [
        { value: null, text: "Please select an option" },
        { value: "a", text: "This is First option" },
        { value: "b", text: "Selected Option" },
        { value: { C: "3PO" }, text: "This is an option with object value" },
        { value: "d", text: "This one is disabled", disabled: true },
      ],
    };
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
