<template>
  <b-container>
    <b-row>
      <b-col sm="3"><img src="@/assets/side.jpg" /></b-col>
      <b-col sm="5">
        <div class="oneLine">
          <h3>주택 관련 기사</h3>
          <router-link :to="{ name: 'aptnews' }" align="right"
            >더보기</router-link
          >
        </div>
        <hr />
        <div class="list-group">
          <li
            style="list-style: none"
            v-for="(article, index) in aptnews"
            :key="index"
          >
            <a
              v-if="index < 5"
              :href="article.url"
              target="_blank"
              class="list-group-item list-group-item-action"
              :title="article.title"
              >{{ article.title }}</a
            >
          </li>
        </div>
      </b-col>
      <b-col sm="4">
        <div class="oneLine">
          <h3>오늘의 뉴스</h3>
          <router-link :to="{ name: 'todaynews' }" align="right"
            >더보기</router-link
          >
        </div>
        <hr />
        <div class="list-group">
          <li
            style="list-style: none"
            v-for="(article, index) in news"
            :key="index"
          >
            <a
              v-if="index < 5"
              :href="article.url"
              target="_blank"
              class="list-group-item list-group-item-action"
              :title="article.title"
              >{{ article.title }}</a
            >
          </li>
        </div>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import http from "@/api/http";

export default {
  name: "HomeArticle",
  data() {
    return {
      news: [],
      aptnews: [],
    };
  },
  created() {
    http.get(`/news`).then(({ data }) => {
      this.news = data;
    });
    http.get(`/news/apt`).then(({ data }) => {
      //this.aptnews = data;
      //console.log(data);
      this.aptnews = data;
    });
  },
};
</script>

<style scoped>
h3 {
  font-weight: bold;
}
</style>
