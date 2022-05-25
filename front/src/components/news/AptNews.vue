<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show
          ><h3><b-icon icon="newspaper"></b-icon> 주택 관련 기사</h3>
          <p>아파트 매매 관련 최신 뉴스를 빠르게 열람하실 수 있습니다.</p>
        </b-alert>
      </b-col>
    </b-row>
    <br />
    <b-table
      id="my-table"
      :fields="fields"
      :items="news"
      :per-page="perPage"
      :current-page="currentPage"
      small
      responsive="sm"
    >
      <template #cell(index)="data">
        {{ data.index + 1 }}
      </template>
      <template #cell(titles)="data">
        <a :href="data.value.url" target="_blank">{{ data.value.title }}</a>
      </template>
    </b-table>
    <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      aria-controls="my-table"
      align="center"
    ></b-pagination>
  </b-container>
</template>

<script>
import http from "@/api/http";

export default {
  name: "AptNews",
  data() {
    return {
      fields: [
        { key: "index", label: "글 번호" },
        { key: "titles", label: "제 목" },
      ],
      perPage: 10,
      currentPage: 1,
      news: [{ titles: { title: "", url: "" } }],
    };
  },
  created() {
    http.get(`/news/apt`).then(({ data }) => {
      // console.log(data);
      this.news = data.map((news) => {
        return {
          titles: {
            title: news.title,
            url: news.url,
          },
        };
      });
      // this.news.title = data.title;
      // this.news.url = data.url;
    });
  },
  computed: {
    rows() {
      return this.news.length;
    },
  },
};
</script>

<style></style>
