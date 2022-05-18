import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: () => import("@/views/HomeView.vue"),
  },
  {
    path: "/signup",
    name: "signup",
    component: () => import("@/views/SignUpView.vue"),
  },
  {
    path: "/login",
    name: "login",
    component: () => import("@/views/LoginView.vue"),
  },
  {
    path: "/notice",
    name: "notice",
    component: () => import("@/views/NoticeView.vue"),
  },
  {
    path: "/profile",
    name: "profile",
    component: () => import("@/views/ProfileView.vue"),
  },
  {
    path: "/admin",
    name: "admin",
    component: () => import("@/views/AdminView.vue"),
    redirect: "/admin/list",
    children: [
      {
        path: "list",
        name: "userList",
        component: () => import("@/components/admin/UserList.vue"),
      },
      {
        path: "regist",
        name: "userRegister",
        component: () => import("@/components/admin/UserRegister.vue"),
      },
      {
        path: "detail/:id",
        name: "userDetail",
        component: () => import("@/components/admin/UserDetail.vue"),
      },
      {
        path: "delete/:id",
        name: "userDelete",
        component: () => import("@/components/admin/UserDelete.vue"),
      },
    ],
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
