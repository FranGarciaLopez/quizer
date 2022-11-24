<template>
    <div id="app" style="background: linear-gradient(#D5DBDB, #F4F6F6);">
      <router-view/>
    </div>
</template>

<script>
import NavView from '@/views/Pages/NavView.vue';

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
        const status = JSON.stringify(response.status);
        if(status == 401){
          this.$store.dispatch('logout')
          this.$router.push({name:'secureView'})
        }
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
