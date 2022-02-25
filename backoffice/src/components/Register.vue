<template>

    <div>
        <h4>Register</h4>
        <form @submit.prevent="register">
            <div>
                <input required v-model="user_name" type="text" placeholder="User Name"/>
            </div>

            <div>
                <input required v-model="nickname" id="nickname" type="text" placeholder="Nick Name">
            </div>

            <div>
                <input required v-model="password" id="password" type="password" placeholder="Password">
            </div>
            <br>
            <select v-model="lang" id="lang"  class="form-select-lg">
                <option value="es">es</option>
                <option value="en">en</option>
                <option value="de">de</option>
            </select>
                         
            <br><br>
            <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
        </form>
    </div>
</template>

<script>
import bcrypt from 'bcryptjs';
/* import auth from "@/logic/auth";*/
export default {
   data: () => ({
    user_name: '',
    password: '',
    nickname: '',
    lang: '',
    error: false
  }),   
    methods: {
        register () {
            this.$store
            .dispatch('register', {
                user_name: this.user_name,
                nickname: this.nickname,
                password: this.encryptPassword(this.password),
                lang: this.lang
            })
            .then(()=>{
                this.$router.push({name: 'home'})
            })
        },
        encryptPassword(password) {
            const salt = "$2a$10$fz7KW7q9Yw31TA/Jb5FZJe"
            password = bcrypt.hashSync(password, salt)
            return password
        },
    }
}
</script>