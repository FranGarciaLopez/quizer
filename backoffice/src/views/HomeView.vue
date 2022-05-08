<template>
  
  <div class="home">
    <Sidebar/>
    <div class="content">

    </div>
  </div>
</template>;

<script>
import Sidebar from '../components/Sidebar.vue'
import {authComputed} from '../store/helpers.js'
export default {
  name: 'homeView',
  computed:{
    ...authComputed
  },
  components:{
    Sidebar
  }
}
</script>

<style scoped>
.home{
  display: grid;
  grid-template-columns: 1fr 5fr;
  background-color: teal;
  height: 100vh;
  width: 100%;
}

.content {
  background-color: white;
  border-radius: 20px;
  margin: 6px 6px 6px 0px;
  color: rgb(167, 167, 167);
  
}
.hero {
  text-align: center;
  background-image: url('https://cdn.auth0.com/blog/vue-meetup/event-banner.png');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  height: 400px;
}
.hero-body .title {
  text-shadow: 4px 4px 4px rgba(0, 0, 0, 0.6);
  padding: 40px 0 20px 0;
  font-size: 60px;
}
.subtitle {
  text-shadow: 4px 4px 4px rgba(0, 0, 0, 0.7);
  font-size: 30px;
}
.button-block {
  text-align: center;
  margin-left: auto;
  margin-right: auto;
  width: 100%;
  position: absolute;
  bottom: -150px;
.button {
  margin-right: 50px;
  padding-left: 50px;
  padding-right: 50px;
}
.welcome {
  width: 400px;
  padding: 10px;
  margin-left: auto;
  margin-right: auto;
}
}
.is-xl {
  font-size: 1.7rem;
}
</style>