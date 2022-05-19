<template>
    <div class="content">
        <h1>New user</h1>
        <form @submit.prevent="addUser">
            <div>
                <input required v-model="name" id="name" type="text" placeholder="User Name"/>
            </div>

            <div>
                <input required v-model="surname" id="surname" type="text" placeholder="Surname">
            </div>

            <div>
                <input required v-model="nickname" id="nickname" type="text" placeholder="Nick Name">
            </div>

            <br>
            <select v-model="lang" id="lang"  class="form-select-lg">
                <option value="es">es</option>
                <option value="en">en</option>
                <option value="de">de</option>
            </select>
            
            <div>
                <input required v-model="email" id="email" type="email" placeholder="Email">
            </div>

            <div>
                <input required v-model="password" id="password" type="password" placeholder="Password">
            </div>   
            <br><br>
            <button type="submit" class="btn btn-primary btn-lg btn-block">Add User</button>
        </form>
    </div>
</template>

<script>
import bcrypt from 'bcryptjs';
import axios from "axios";
export default {
    name:"addUserView", 
    data: () => ({
        name: '',
        nickname: '',
        surname: '',
        email: '',
        lang: '',
        telegram_id: 3,
        password: '',
        error: false
    }),   
    methods: {
        addUser () {
            var newUser = {
                name: this.name,
                nickname: this.nickname,
                surname: this.surname,
                email: this.email,
                lang: this.lang,
                telegram_id: this.telegram_id,
                password: this.encryptPassword(this.password),
            };
            axios.post('http://localhost:3000/users', newUser)
            .then(()=>{
                this.$router.push("/users")
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