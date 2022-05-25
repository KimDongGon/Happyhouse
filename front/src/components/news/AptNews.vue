<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show
          ><h3><b-icon icon="list"></b-icon>주택 관련 기사</h3>
          <p>아파트 매매 관련 최신 뉴스를 빠르게 열람하실 수 있습니다.</p>
        </b-alert>
      </b-col>
    </b-row>
    <br />
    <b-row>
      <b-col v-if="news.length">
        <b-table-simple hover responsive>
          <b-thead head-variant="dark">
            <b-tr>
              <b-th>글 번호</b-th>
              <b-th>제 목</b-th>
            </b-tr>
          </b-thead>
          <b-tbody v-for="(article, index) in news" :key="index">
            <b-tr>
              <b-td>{{ index + 1 }}</b-td>
              <b-td
                ><a
                  :href="article.url"
                  target="_blank"
                  :title="article.title"
                  >{{ article.title }}</a
                ></b-td
              >
            </b-tr>
          </b-tbody>
        </b-table-simple>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import http from "@/api/http";

export default {
  name: "TodayNews",
  data() {
    return {
      news: [],
    };
  },
  created() {
    http.get(`/news/apt`).then(({ data }) => {
      this.news = data;
    });
  },
};
</script>

<style></style>
