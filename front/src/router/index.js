import Vue from "vue";
import VueRouter from "vue-router";
import store from "@/store";

Vue.use(VueRouter);

// eslint-disable-next-line no-unused-vars
const beforeEnterNotLogin = (from, to, next) => {
  const isAuthenticated = store.state.isAuthenticated;
  if (!isAuthenticated) {
    return next();
  } else {
    alert("잘못된 접근입니다.");
    next("/");
  }
};

// eslint-disable-next-line no-unused-vars
const beforeEnterLogin = (from, to, next) => {
  const isAuthenticated = store.state.isAuthenticated;
  if (isAuthenticated) {
    return next();
  } else {
    alert("로그인 후 이용해주세요.");
    next("/");
  }
};

// eslint-disable-next-line no-unused-vars
const beforeAdmin = (from, to, next) => {
  const isAuthenticated = store.state.isAuthenticated;
  const isAdmin = store.getters.isAdmin;
  if (isAuthenticated && isAdmin) {
    return next();
  } else {
    alert("잘못된 접근입니다.");
    next("/");
  }
};

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
    beforeEnter: beforeEnterNotLogin,
  },
  {
    path: "/login",
    name: "login",
    component: () => import("@/views/LoginView.vue"),
    beforeEnter: beforeEnterNotLogin,
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
    path: "/mypage",
    name: "mypage",
    redirect: "/mypage/detail",
    component: () => import("@/views/ProfileView.vue"),
    beforeEnter: beforeEnterLogin,
    children: [
      {
        path: "detail",
        name: "mypageDetail",
        component: () => import("@/components/user/UserDetail.vue"),
      },
      {
        path: "modify",
        name: "mypageModify",
        component: () => import("@/components/user/UserModify.vue"),
      },
    ],
  },
  {
    path: "/search",
    name: "search",
    component: () => import("@/views/SearchView.vue"),
    beforeEnter: beforeEnterLogin,
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
    beforeEnter: beforeAdmin,
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
