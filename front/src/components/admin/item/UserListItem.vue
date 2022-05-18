<template>
  <b-tr>
    <b-td>{{ id }}</b-td>
    <b-th class="text-left">
      <router-link :to="{ name: 'userDetail', params: { id: id } }">{{
        password
      }}</router-link>
    </b-th>
    <b-td>{{ name }}</b-td>
    <b-td>{{ address }}</b-td>
    <b-td>{{ number }}</b-td>
    <b-th class="text-left">
      <router-link :to="{ name: 'userDelete', params: { id: id } }">
        삭제
      </router-link>
    </b-th>
  </b-tr>
</template>

<script>
export default {
  name: "UserListItem",
  props: {
    id: String,
    password: String,
    name: String,
    address: String,
    number: String,
  },
};
</script>

<style></style>
