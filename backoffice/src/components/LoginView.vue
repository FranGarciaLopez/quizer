<template>
  <div>
    <div v-if="error == true" class="alert alert-danger">{{ this.error_msg }}</div>
    <form class="login" @submit.prevent="login">
     
      
      <h1>Sign in</h1>
      <input required v-model="nickname" type="text" placeholder="NickName"/>
      <br>
      <input required v-model="password" type="password" placeholder="Password"/>
      <br><br/>
      <button type="submit"  class="btn btn-primary btn-lg btn-block">Login</button>
      
    </form>
    
  </div>
</template>


<script>
import bcrypt from "bcryptjs";

export default {
  data: function() {
    return {
      nickname: '',
      password: '',
      error: false,
      error_msg: '',
    }
  },
  methods: {
    login() {
      try{
        this.$store.dispatch('login',{
          nickname: this.nickname, 
          password: this.encryptPassword(this.password)
        })
        .then(()=>{
          this.$router.push({name:'homeView'})
        })
        this.error = false;

      }catch(error){
        this.error = true;
        this.error_msg = "User and Password does not match";
      }
    },
      
    encryptPassword(password) {
      const salt = "$2a$10$fz7KW7q9Yw31TA/Jb5FZJe"
      password = bcrypt.hashSync(password, salt)
      return password
    },
  }
}
</script>