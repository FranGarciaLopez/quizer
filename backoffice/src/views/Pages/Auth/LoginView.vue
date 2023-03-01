<template>
  <div class="pr-4 content d-flex flex-column min-vh-100 justify-content-center">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-4 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
            <form @submit.prevent="login">
              <div class="form-floating mb-3">
                <input class="form-control" id="floatingInput" required v-model="nickname" type="text" placeholder="Nickname"/>
                <label for="floatingInput">Nickname</label>
              </div>
              <div class="form-floating mb-3">
                <input class="form-control" required v-model="password" id="floatingPassword" type="password" placeholder="Password" autocomplete="false"/>
                <label for="floatingPassword">Password</label>
              </div>

              <div class="d-grid">
                <button class="btn btn-primary btn-login text-uppercase fw-bold mb-3" type="submit">
                  Sign in
                </button>
              </div>
              <div v-if="this.error" class="alert alert-danger text-center mb-5 fw-light fs-5">
                {{error_msg}}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import bcrypt from "bcryptjs";

export default {
  data: function() {
    return {
      nickname: '',
      password: '',
      is_admin:'',
      error: false,
      error_msg:" ",
    }
  },
  methods: {
    login() {
      this.$store.dispatch('login',{
        nickname: this.nickname, 
        password: this.password,
        is_admin: this.is_admin,
      })
      .then(() => {
        this.error = false;
        this.error_msg = " ";
        var user = JSON.parse(localStorage.user);
        if(user.is_admin == true){
          this.$router.push('/admin/users');
        }
        else {
          this.$router.push({name: 'userPathsView', params: { user_id: user.user_id }});
        }
       
      })
      .catch((error) => {
        if (error.response.status == 401) {
          this.error = true;
          this.error_msg = "User and password does not match";
        }
      });
    },
  },
}
</script>
