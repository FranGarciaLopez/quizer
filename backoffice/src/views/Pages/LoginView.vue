<template>
  <div class="content">
    <div v-if="error" class="alert alert-danger">
      {{ error_msg }}
    </div>
    <form class="login" @submit.prevent="login">
      <h1>Sign in</h1>
      
      <input required v-model="nickname" type="text" placeholder="NickName"/>
      <br>
      <input required type="password" placeholder="Password" v-model="password" autocomplete="false"/>
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
      error_msg:"",
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


<style scoped>
.content{
    position:fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    width: 40%;
    height: 40%;
}
</style>