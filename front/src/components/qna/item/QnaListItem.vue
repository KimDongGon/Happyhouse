<template>
  <b-tr>
    <b-td>{{ no }}</b-td>
    <b-th class="text-left">
      <router-link :to="{ name: 'qnaDetail', params: { no: no } }">{{
        title
      }}</router-link>
    </b-th>
    <b-td>{{ id }}</b-td>
    <b-td>{{ hit }}</b-td>
    <b-td>{{ regtime | dateFormat }}</b-td>
    <b-td>{{ replycount }}</b-td>
  </b-tr>
</template>

<script>
import moment from "moment";
import { mapState } from "vuex";

export default {
  name: "QnaListItem",
  props: {
    no: Number,
    id: String,
    title: String,
    hit: Number,
    replycount: Number,
    regtime: String,
  },
  computed: {
    ...mapState(["replyCount"]),
  },
  filters: {
    dateFormat(regtime) {
      return moment(new Date(regtime)).format("YY.MM.DD");
    },
  },
};
</script>

<style></style>
