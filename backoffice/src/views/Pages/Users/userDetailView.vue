<template>
    <div class="main_content">
        <Breadcrumb/>
        <Sidebar>
            <template v-slot:body>
                <div class="content">
                    <div v-if="loggedIn">
                        <h1 v-if="$route.params.id == 'new'">
                            Add new user
                        </h1>
                        <h1 v-else>
                            Edit user {{$route.params.id}}
                        </h1>
                        <form @submit.prevent="save">
                            <div class="form-group mb-3">
                                <label for="form-label">Name: </label>
                                <input class="form-control d-inline-block col-md-5" required type="text" placeholder="Name" v-model="user.name"/>
                            </div>
                            
                            <br>
                            <div class="form-group mb-3">
                                <label for="form-label" name="surname">Surname: </label>
                                <input class="form-control d-inline-block col-md-5" required v-model="user.surname" id="surname" type="text" placeholder="Surname">
                            </div>
                            
                            <br>
                            <div class="form-group mb-3">
                                <label for="form-label" name="surname">Nickname: </label>
                                <input class="form-control d-inline-block col-md-5" required v-model="user.nickname" id="nickname" type="text" placeholder="Nick Name">
                            </div>

                            <br>
                            <div class="form-group">
                                <label for="form-label" name="surname">Language: </label>
                                <select v-model="user.lang" id="lang"  class="form-select mb-3 d-inline-block col-md-5">
                                    <option value="es">es</option>
                                    <option value="en">en</option>
                                    <option value="de">de</option>
                                </select>
                            </div>
                            
                            <br>
                            <div class="form-group mb-3">
                                <label for="form-label" name="surname">E-mail: </label>
                                <input class="form-control d-inline-block col-md-5" required v-model="user.email" id="email" type="email" placeholder="Email">
                            </div>

                            <br>
                            <div class="form-group mb-3">
                                <label for="form-label" name="surname">Password: </label>
                                <input class="form-control d-inline-block col-md-5" required v-model="user.password" id="password" type="password" placeholder="Password">
                            </div>   

                            <br>
                            <div class="buttons">
                                <router-link to="/users"><button type="submit" class="btn btn-danger btn-lg">Cancel</button></router-link>
                                <div class="space"></div>
                                <button type="submit" class="btn btn-primary btn-lg">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </template>
        </Sidebar>
    </div>
    
</template>

<script>
import bcrypt from 'bcryptjs';
import axios from "axios";
import Breadcrumb from '@/components/BreadCrumb.vue';
import Sidebar from '@/components/Sidebar.vue';
import {authComputed} from '@/store/helpers.js';
export default {
    name:"addUserView",
    components: {
        Sidebar,
        Breadcrumb,
    },
    data: () => ({
        usersApiUrl: "http://localhost:3000/users",
        user: {
            name: '',
            nickname: '',
            surname: '',
            email: '',
            lang: '',
            telegram_id: 3,
            password: '',
            error: false
        }
    }),
    mounted() {
        axios
        .get(this.usersApiUrl+`/${this.$route.params.id}`)
        .then((response) => {
            return (this.user = response.data[0]);
        })
        .catch((error) => console.log(error));
    },   
    methods: {
        save () {
            if(this.$route.params.id == 'new'){
                var newUser = {
                    name: this.user.name,
                    nickname: this.user.nickname,
                    surname: this.user.surname,
                    email: this.user.email,
                    lang: this.user.lang,
                    telegram_id: this.user.telegram_id,
                    password: this.encryptPassword(this.user.password),
                };
                axios.post(this.usersApiUrl, newUser)
                .then(()=>{
                    this.$router.push("/users")
                })
            }else{
                var updatedUser = {
                    name: this.user.name,
                    nickname: this.user.nickname,
                    surname: this.user.surname,
                    email: this.user.email,
                    lang: this.user.lang,
                    telegram_id: this.user.telegram_id,
                    password: this.encryptPassword(this.user.password),
                };
                axios.put(this.usersApiUrl+`/${this.$route.params.id}`, updatedUser)
                .then(()=>{
                    this.$router.push("/users")
                })
            }
            
        },
        encryptPassword(password) {
            const salt =  "$2a$10$fz7KW7q9Yw31TA/Jb5FZJe"
            password = bcrypt.hashSync(password, salt)
            return password
        },
    },
    computed:{
        ...authComputed
    },
}
</script>
