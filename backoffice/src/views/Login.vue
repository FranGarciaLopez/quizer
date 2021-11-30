<template>
  <div class="login">
    <div class="wrapper fadeInDown">
      <div id="formContent">

        <div class="fadeIn first">
          <img src="../assets/logo.png" id="icon" alt="User Icon" />
        </div>

        <form v-on:submit.prevent="onSubmit">
          <input type="text" id="user" class="fadeIn second" name="login" placeholder="User" v-model="user"/>
          <input type="text" id="password" class="fadeIn third" name="login" placeholder="Password" v-model="password"/>
          <input type="submit" class="fadeIn fourth" value="Log In"/>
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
  name: 'Login',
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
    onSubmit() {
      console.log("IN", this.user, this.password)
      debugger;
      if(this.user === 'fran' && this.password === '1234'){
        this.error = false;
        console.log('login ok');
      }
      else {
        this.error = true;
        this.error_msg = 'User and password does not match';
      }
      /*       let json = {
        "usuario": this.user,
        "password": this.password
      }; 
      axios.post('http://localhost:3000/users', json).then(data => {
        if(data.data.status == "ok"){
          console.log("Ok")
        }else{
          this.error = true;
          this.error_msg = data.data.result.error_msg;
          
        }
      }) */
    }
  }
}
</script>;
