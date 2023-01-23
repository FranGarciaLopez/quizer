<template>
<nav class="navbar navbar-expand-md navbar-light bg-primary">
  <div class="container-fluid">
    <div v-if="loggedIn">
      <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <h1 class="p-2 navbar-brand">userApp</h1>
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0 d-flex align-items-start" v-if="this.$route.name === 'userPathsView'">
          <li class="nav-item active">
            <router-link v-bind:to="`/user/${this.$route.params.user_id}/paths`" class="p-2 text-white navbar-brand">Paths</router-link>
            <!--<router-link v-bind:to="`/user/${this.$route.params.user_id}/paths/${this.$route.params.path_id}`" class="p-2 text-white navbar-brand">Tests</router-link>-->
          </li>
        </ul>
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0 d-flex align-items-start" v-else>
          <li class="nav-item active">
            <router-link v-bind:to="`/user/${this.$route.params.user_id}/paths`" class="p-2 text-white navbar-brand">Paths</router-link>
            <router-link v-bind:to="`/user/${this.$route.params.user_id}/paths/${this.$route.params.path_id}`" class="p-2 text-white navbar-brand">Tests</router-link>
          </li>
        </ul>
      </div>
    </div>
    <button @click="logout" class="btn text-white"><i class="bi bi-box-arrow-left"> Logout</i></button>
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
