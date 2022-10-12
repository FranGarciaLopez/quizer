<template>
  <div class="content">
    <h1>Sign in</h1>
    <form class="m-5" @submit.prevent="login">
      <div>
          <div class="mb-3 form-group">
            <input class="form-control d-inline-block col-md-5" required v-model="nickname" type="text" placeholder="NickName"/>
<!--             <label for="inputEmail" class="form-label">Nick Name</label> -->
          </div>
          
          <div class="mb-3 form-group">
            <!-- <label for="inputPassword" class="form-group-prepend form-label control-label">Password</label> -->
            <input class="form-control d-inline-block col-md-5" required v-model="password" type="password" placeholder="Password" autocomplete="false"/>
          </div>
          
          <div v-if="error == true" class="alert alert-danger">
            {{error_msg}}
          </div>
          
          <div class="box-footer">
            <button type="submit" class="d-inline-block col-md-5 btn btn-primary btn-lg btn-block">Login</button>
          </div>
      </div>
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
      this.$store.dispatch('login',{
        nickname: this.nickname, 
        password: this.encryptPassword(this.password)
      })
      .then(()=>{
        this.error = false,
        this.$router.push({name:"Users"})
      })
      this.error = true;
      this.error_msg = "User and password does not match"
    },
    encryptPassword(password) {
      const salt = "$2a$10$fz7KW7q9Yw31TA/Jb5FZJe"
      password = bcrypt.hashSync(password, salt)
      return password
    },
  },
  
}
</script>
