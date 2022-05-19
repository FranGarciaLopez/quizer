<template>
    <div class="content">
        <h1>Register</h1>
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
                this.$router.push({name: 'login'})
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