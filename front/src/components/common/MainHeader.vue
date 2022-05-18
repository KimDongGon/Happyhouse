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
          <b-navbar-nav>
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

          <b-navbar-nav>
            <b-nav-item href="#"
              ><router-link to="/profile" class="text-light"
                >Profile</router-link
              ></b-nav-item
            >
            <b-nav-item href="#"
              ><router-link to="/admin" class="text-light"
                >UserList</router-link
              ></b-nav-item
            >
            <b-nav-item href="#"
              ><router-link to="/" class="text-light"
                >Logout</router-link
              ></b-nav-item
            >
            <b-nav-item href="#"
              ><router-link to="/" class="text-light"
                >Notice</router-link
              ></b-nav-item
            >
            <b-nav-item href="#"
              ><router-link to="/" class="text-light"
                >QnA</router-link
              ></b-nav-item
            >
          </b-navbar-nav>
        </b-collapse>
      </div>
    </b-navbar>
    <!-- <div class="container">
      <router-link to="/"><img src="@/assets/logo.jpg" /></router-link>
      <router-link to="/notice" class="text-dark">공지사항</router-link>
      <router-link to="/" class="text-dark">오늘의 뉴스</router-link>
    </div> -->
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
img {
  width: 200px;
  height: "100%";
}
.navbar-nav {
  margin-left: auto;
}
a {
  text-decoration: none;
}
</style>
