<template>
<nav class="navbar navbar-expand-md navbar-light bg-primary">
  <div class="container-fluid">
    <router-link to="/" class="p-2 text-white navbar-brand">Home</router-link>
    <div v-if="!loggedIn">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="p-2 navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <ul class="navbar-nav me-auto mb-md-0">
            <li class="nav-item">
              <router-link to="/login" class="text-white navbar-brand">Login</router-link>
            </li>
            <li class="nav-item">
              <router-link to="/register" class="text-white navbar-brand">Register</router-link>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <button v-else type="button" class="logoutButton" @click="logout">
      Logout
    </button>
  </div>
</nav>
</template>

<script>
import { authComputed } from '@/store/helpers.js'
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
