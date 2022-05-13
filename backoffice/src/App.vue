<template>
    <div id="app">
      <nav-view/>
      <router-view/>
    </div>
    
</template>

<script>
import NavView from '../src/views/Pages/NavView.vue';
export default {
  name: 'App',
  components: {
    NavView,
  },
  mounted() {
    if (localStorage.user) {
      var user = JSON.parse(localStorage.user)
      if (user.AccessToken){
        this.$store.dispatch('setUser',user)
      }
      else {
        this.$router.push({name:'login'})
      }
        
    }
  },
}
</script>

<style>
#app {
  font-family: 'Roboto', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

</style>
