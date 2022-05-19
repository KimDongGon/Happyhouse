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
    redirect: "/notice/list",
    children: [
      {
        path: "list",
        name: "noticeList",
        component: () => import("@/components/notice/NoticeList.vue"),
      },
      {
        path: "wtite",
        name: "noticeRegister",
        component: () => import("@/components/notice/NoticeRegister.vue"),
      },
      {
        path: "detail",
        name: "noticeDetail",
        component: () => import("@/components/notice/NoticeDetail.vue"),
      },
      {
        path: "modify",
        name: "noticeModify",
        component: () => import("@/components/notice/NoticeModify.vue"),
      },
      {
        path: "delete",
        name: "noticeDelete",
        component: () => import("@/components/notice/NoticeDelete.vue"),
      },
    ],
  },
  {
    path: "/profile",
    name: "profile",
    component: () => import("@/views/ProfileView.vue"),
  },
  {
    path: "/search",
    name: "search",
    component: () => import("@/views/SearchView.vue"),
  },
  {
    path: "/qna",
    name: "qna",
    component: () => import("@/views/QnaView.vue"),
    redirect: "/qna/list",
    children: [
      {
        path: "list",
        name: "qnaList",
        component: () => import("@/components/qna/QnaList.vue"),
      },
      {
        path: "wtite",
        name: "qnaRegister",
        component: () => import("@/components/qna/QnaRegister.vue"),
      },
      {
        path: "detail",
        name: "qnaDetail",
        component: () => import("@/components/qna/QnaDetail.vue"),
      },
      {
        path: "modify",
        name: "qnaModify",
        component: () => import("@/components/qna/QnaModify.vue"),
      },
      {
        path: "delete",
        name: "qnaDelete",
        component: () => import("@/components/qna/QnaDelete.vue"),
      },
    ],
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
      {
        path: "modify",
        name: "userModify",
        component: () => import("@/components/admin/UserModify.vue"),
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
