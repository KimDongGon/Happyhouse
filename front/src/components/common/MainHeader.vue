<template>
  <div>
    <b-navbar toggleable="lg" type="dark" variant="dark">
      <div class="container">
        <b-navbar-brand href="#"
          ><router-link to="/" class="text-light"
            ><h3>HappyHouse</h3></router-link
          ></b-navbar-brand
        >
        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav class="nav" v-if="!isAuthenticated">
            <b-nav-item to="/signup" link-classes="text-light"
              >회원가입</b-nav-item
            >
            <b-nav-item to="/login" link-classes="text-light"
              >로그인</b-nav-item
            >
          </b-navbar-nav>

          <b-navbar-nav class="nav" v-else>
            <b-nav-item to="/mypage" link-classes="text-light pe-0 user-name"
              >{{ username }}
            </b-nav-item>
            <b-nav-text class="text-light pe-2">님 환영합니다.</b-nav-text>
            <b-nav-item to="/admin" link-classes="text-light" v-if="isAdmin"
              >회원목록</b-nav-item
            >
            <b-nav-item href="#"
              ><a class="text-light" @click="logout">로그아웃</a></b-nav-item
            >
          </b-navbar-nav>
          <b-navbar-nav>
            <b-nav-item to="/notice" link-classes="text-light"
              >공지사항</b-nav-item
            >
            <b-nav-item to="/qna" link-classes="text-light">QnA</b-nav-item>
          </b-navbar-nav>
        </b-collapse>
      </div>
    </b-navbar>
    <main-banner />
  </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import MainBanner from "./MainBanner.vue";
export default {
  components: { MainBanner },
  computed: {
    ...mapGetters(["isAdmin"]),
    ...mapState(["username", "isAuthenticated"]),
  },
  methods: {
    logout() {
      this.$store.dispatch("logout");
    },
  },
};
</script>

<style scoped>
img {
  width: 200px;
  height: "100%";
}
.nav {
  margin-left: auto;
}
a {
  text-decoration: none;
}
.user-name {
  font-weight: bold;
}
</style>
