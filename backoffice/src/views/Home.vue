<template>
  <div class="home">

    <div class="fadeIn first">
      Wellcome to home
    </div>

  </div>
</template>;

<script>
//import axios from 'axios';
export default {
  name: 'home',
  components: {

  },
  data: function () {
    return {}
  },
  methods: {
    validateUser() {
      if(!this.user){
        this.$router.push('/login')
      }
    }
  },
  beforeMount(){
    this.validateUser()
 },
}
</script>;
