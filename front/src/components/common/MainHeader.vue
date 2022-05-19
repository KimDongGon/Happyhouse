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
          <b-navbar-nav class="nav" v-if="isLoggedIn">
            <b-nav-item href="#"
              ><router-link to="/signup" class="text-light"
                >signup</router-link
              ></b-nav-item
            >
            <b-nav-item href="#"
              ><router-link to="/login" class="text-light"
                >login</router-link
              ></b-nav-item
            >
          </b-navbar-nav>

          <b-navbar-nav class="nav" v-else>
            <b-nav-item href="#"
              ><router-link to="/profile" class="text-light"
                >Profile</router-link
              ></b-nav-item
            >
            <b-nav-item href="#" v-if="isAdmin"
              ><router-link to="/admin" class="text-light"
                >UserList</router-link
              ></b-nav-item
            >
            <b-nav-item href="#"
              ><a class="text-light" @click="logout">Logout</a></b-nav-item
            >
          </b-navbar-nav>
          <b-navbar-nav>
            <b-nav-item href="#"
              ><router-link to="/notice" class="text-light"
                >Notice</router-link
              ></b-nav-item
            >
            <b-nav-item href="#"
              ><router-link to="/qna" class="text-light"
                >QnA</router-link
              ></b-nav-item
            >
          </b-navbar-nav>
        </b-collapse>
      </div>
    </b-navbar>
    <main-banner />
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import MainBanner from "./MainBanner.vue";
export default {
  components: { MainBanner },
  computed: {
    ...mapGetters(["isLoggedIn", "isAdmin"]),
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
</style>
