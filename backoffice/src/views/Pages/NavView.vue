<template>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
  <div class="container-fluid">
    <router-link to="/" class="navbar-brand">Home</router-link>
    <div v-if="!loggedIn">
      <ul class="navbar-nav me-auto mb-md-0">
        <li class="nav-item">
          <router-link to="/login" class="navbar-brand">Login</router-link>
        </li>
        <li class="nav-item">
          <router-link to="/register" class="navbar-brand">Register</router-link>
        </li>
      </ul>
    </div>
    <button v-else type="button" class="logoutButton" @click="logout">
      Logout
    </button>
  </div>
</nav>

</template>

<script>
import { authComputed } from '../../store/helpers.js'
export default {
  name: 'NavView',
  computed: {
    ...authComputed
  },
  methods: {
    logout() {
      this.$store.dispatch('logout')
    }
  }
}
</script>;
