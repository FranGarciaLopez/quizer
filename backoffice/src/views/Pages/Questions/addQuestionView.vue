<template>
    <div class="content">
        <h1>New question</h1>
        <form @submit.prevent="addUser">
            <div>
                <input required v-model="text" id="text" type="text" placeholder="Question"/>
            </div>
            <div>
                <input required v-model="text" id="text" type="text" placeholder="Answer1 text">
                <input required v-model="text" id="text" type="text" placeholder="Answer1 result">
                <input required v-model="text" id="text" type="text" placeholder="Answer2 text">
                <input required v-model="text" id="text" type="text" placeholder="Answer2 result">
            </div>  
            <br><br>
            <button type="submit" class="btn btn-primary btn-lg btn-block">Add question</button>
        </form>
    </div>
</template>

<script>
import bcrypt from 'bcryptjs';
import axios from "axios";
export default {
    name:"addQuestionView", 
    data: () => ({
        name: '',
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