<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>공지사항</h3></b-alert>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col style="text-align: end">
        <b-button variant="outline-primary" @click="moveWrite()" v-if="isAdmin"
          >등록</b-button
        >
      </b-col>
    </b-row>
    <b-row>
      <b-col v-if="notices.length">
        <b-table-simple hover responsive>
          <b-thead head-variant="dark">
            <b-tr>
              <b-th>글번호</b-th>
              <b-th>제목</b-th>
              <b-th>작성자</b-th>
              <b-th>작성일</b-th>
              <b-th>보기</b-th>
            </b-tr>
          </b-thead>
          <tbody>
            <!-- 하위 component인 ListRow에 데이터 전달(props) -->
            <notice-list-item
              v-for="notice in notices"
              :key="notice.no"
              v-bind="notice"
            />
          </tbody>
        </b-table-simple>
      </b-col>
      <b-col v-else class="text-center">등록된 공지사항이 없습니다.</b-col>
    </b-row>
  </b-container>
</template>

<script>
import http from "@/api/http";
import { mapGetters } from "vuex";
import NoticeListItem from "@/components/notice/item/NoticeListItem";

export default {
  name: "NoticeList",
  components: {
    NoticeListItem,
  },
  computed: {
    ...mapGetters(["isAdmin"]),
  },
  data() {
    return {
      notices: [],
    };
  },
  created() {
    http.get(`/notice/list`).then(({ data }) => {
      this.notices = data;
    });
  },
  methods: {
    moveWrite() {
      this.$router.push({ name: "noticeRegister" });
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
