<template>
  <div class="login">
    <div class="wrapper fadeInDown">
      <div id="formContent">

        <div class="fadeIn first">
          <img src="../assets/logo.png" id="icon" alt="User Icon" />
        </div>

        <form class="login" v-on:submit.prevent="onSubmit">
          <input type="text" id="user" class="fadeIn second" name="login" placeholder="User" v-model="user"/>
          <input type="password" id="password" class="fadeIn third" name="login" placeholder="Password" v-model="password"/>
          <input type="submit" class="fadeIn fourth" value="Login"/>
        </form>

        <div v-if="error" class="alert alert-danger">
          {{ error_msg }}
        </div>

        <div id="formFooter">
          <a class="underlineHover" href="#">Forgot Password?</a>
        </div>

      </div>
    </div>
  </div>
</template>;

<script>
//import axios from 'axios';
export default {
  name: 'login',
  components: {

  },
  data: function () {
    return {
      user: "",
      password: "",
      error: false,
      error_msg: "",
    }
  },
  methods: {
    onSubmit:function() {
      /* console.log("IN", this.user, this.password)
      debugger; */
      let user = this.user
      let password = this.password
      this.$store.dispatch('login', {user, password} )
        .then(()=> this.$router.push('/'))
        .catch(error => console.log(error))
      if(user === 'fran' && password === '1234'){
        this.error = false; 
        
      }
      else {
        this.error = true;
        this.error_msg = 'User and password does not match';
      }
    }
  }
}
</script>;
