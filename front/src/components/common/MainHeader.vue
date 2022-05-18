<template>
  <div>
    <b-navbar
      toggleable="lg"
      type="dark"
      variant="dark"
      class="align-items-end"
    >
      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>
        <b-navbar-nav class="mr-auto">
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

        <b-navbar-nav class="ml-auto">
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
              >logout</router-link
            ></b-nav-item
          >
        </b-navbar-nav>
      </b-collapse>
    </b-navbar>
    <div class="container">
      <router-link to="/"><img src="@/assets/logo.jpg" /></router-link>
      <router-link to="/notice" class="text-dark">공지사항</router-link>
      <router-link to="/" class="text-dark">오늘의 뉴스</router-link>
    </div>
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
</style>
