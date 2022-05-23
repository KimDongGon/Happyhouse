<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>QnA</h3></b-alert>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col style="text-align: end">
        <b-button variant="outline-primary" @click="moveWrite()"
          >글작성</b-button
        >
      </b-col>
    </b-row>
    <b-row class="text-center">
      <b-col cols="12" md="8">
        <b-input-group>
          <b-form-select v-model="key" :options="options"> </b-form-select>
          <b-form-input
            placeholder="검색어"
            v-model="word"
            @keyup.enter.prevent="getQnaList"
          ></b-form-input>
          <b-button variant="primary" @click="getQnaList">검색</b-button>
        </b-input-group>
      </b-col>
    </b-row>
    <br />
    <b-row>
      <b-col v-if="qnas.length">
        <b-table-simple hover responsive>
          <b-thead head-variant="dark">
            <b-tr>
              <b-th>글번호</b-th>
              <b-th>제목</b-th>
              <b-th>작성자ID</b-th>
              <b-th>조회수</b-th>
              <b-th>작성일</b-th>
              <b-th>답글수</b-th>
            </b-tr>
          </b-thead>
          <tbody>
            <!-- 하위 component인 ListRow에 데이터 전달(props) -->
            <qna-list-item v-for="qna in qnas" :key="qna.no" v-bind="qna" />
          </tbody>
        </b-table-simple>
      </b-col>
      <b-col v-else class="text-center">검색 결과가 없습니다.</b-col>
    </b-row>
    <page-link></page-link>
  </b-container>
</template>

<script>
import http from "@/api/http";
import QnaListItem from "@/components/qna/item/QnaListItem";
import PageLink from "@/components/pageLink";

export default {
  name: "QnaList",
  components: {
    QnaListItem,
    PageLink,
  },
  data() {
    return {
      qnas: [],
      options: [
        { value: "null", text: "전체" },
        { value: "no", text: "글 번호" },
        { value: "title", text: "제목" },
        { value: "id", text: "작성자ID" },
      ],
      key: "null",
      word: "",
      pageLimit: 5,
      pageOffset: 0,
    };
  },
  created() {
    this.initComponent();
  },
  watch: {
    "$route.query": function () {
      this.initComponent();
    },
  },
  methods: {
    initComponent() {
      http
        .get("/qna/pagelink", {
          params: {
            limit: this.pageLimit,
            offset: `${this.$route.query.no - this.pageLimit}`,
          },
        })
        .then(({ data }) => {
          this.qnas = data;
        });
    },
    moveWrite() {
      this.$router.push({ name: "qnaRegister" });
    },
    getQnaList() {
      http
        .get(`/qna`, {
          params: {
            key: this.key,
            word: this.word,
          },
        })
        .then(({ data }) => {
          this.qnas = data;
        });
    },
  },
};
</script>

<style scope>
.tdClass {
  width: 50px;
  text-align: center;
}
.tdSubject {
  width: 300px;
  text-align: left;
}
</style>
