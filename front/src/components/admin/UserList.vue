<template>
  <b-container class="bv-example-row mt-3">
    <b-row>
      <b-col>
        <b-alert show><h3>회원 목록</h3></b-alert>
      </b-col>
    </b-row>
    <b-row class="mb-1">
      <b-col class="text-right">
        <b-button variant="outline-primary" @click="moveRegist()"
          >회원등록</b-button
        >
      </b-col>
    </b-row>
    <b-row>
      <b-col v-if="users.length">
        <b-table-simple hover responsive>
          <b-thead head-variant="dark">
            <b-tr>
              <b-th>아이디</b-th>
              <b-th>비밀번호</b-th>
              <b-th>이름</b-th>
              <b-th>주소</b-th>
              <b-th>전화번호</b-th>
              <b-th>수정/삭제</b-th>
            </b-tr>
          </b-thead>
          <tbody>
            <!-- 하위 component인 ListRow에 데이터 전달(props) -->
            <board-list-item
              v-for="(user, index) in users"
              :key="index"
              v-bind="user"
            />
          </tbody>
        </b-table-simple>
      </b-col>
      <b-col v-else class="text-center">회원 목록이 없습니다.</b-col>
    </b-row>
  </b-container>
</template>

<script>
import http from "@/api/http";
import UserListItem from "@/components/admin/item/UserListItem";

export default {
  name: "UserList",
  components: {
    UserListItem,
  },
  data() {
    return {
      users: [],
    };
  },
  created() {
    http.get(`/admin/user`).then(({ data }) => {
      this.users = data;
    });
  },
  methods: {
    moveRegist() {
      this.$router.push({ name: "userRegister" });
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
