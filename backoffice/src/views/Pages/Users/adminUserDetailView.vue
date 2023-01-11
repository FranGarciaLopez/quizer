<template>
    <div class="main_content">
        <Sidebar>
            <template v-slot:body>
                <div class="content">
                    <div v-if="loggedIn">
                        <div class="bg-light">
                            <Breadcrumb/>
                        </div>
                        <div class="pr-4 content d-flex flex-column min-vh-99 justify-content-center">
                            <div class="row">
                                <div class="col-sm-9 col-md-7 col-lg-4 mx-auto">
                                    <div class="card border-0 shadow rounded-3 my-5">
                                        <div class="card-body p-4 p-sm-5">
                                            <h5 v-if="this.$route.params.user_id === 'new'">
                                                Add new user
                                            </h5>
                                            <h5 v-else>
                                                Edit user {{this.$route.params.user_id}}
                                            </h5>
                                            <form @submit.prevent="save">
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="floatingName" required v-model="user.name" type="text" placeholder="Name" />
                                                    <label for="floatingName">Name</label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="floatingSurname" required v-model="user.surname" type="text" placeholder="Surname">
                                                    <label for="floatingSurname">Surname</label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="floatingNickname" required v-model="user.nickname" type="text" placeholder="Nickname">
                                                    <label for="floatingNickname">Nickname</label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <select v-model="user.lang" id="floatingLang" class="form-select">
                                                        <option value="es">es</option>
                                                        <option value="en">en</option>
                                                        <option value="de">de</option>
                                                    </select>
                                                    <label for="floatingLang">Language</label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="floatingEmail" required v-model="user.email" type="email" placeholder="Email">
                                                    <label for="floatingEmail">E-mail</label>
                                                </div>
                                                <div class="form-floating mb-3">
                                                    <input class="form-control" id="floatingPassword" required v-model="user.password" type="password" placeholder="Password"/>
                                                    <label for="floatingPassword">Password</label>
                                                </div>

                                                <div class="buttons">
                                                    <router-link to="/admin/users">
                                                        <button type="submit" class="btn btn-secondary btn-cancel text-uppercase fw-bold mr-1">
                                                            Cancel
                                                        </button>
                                                    </router-link>
                                                    <button type="submit" class="btn btn-primary btn-save text-uppercase fw-bold">Save</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
    name:"adminUserDetailView",
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
            password: '',
            error: false
        }
    }),
    mounted() {
        if (this.$route.params.user_id === "new") {
            return (this.user = {
                name: '',
                nickname: '',
                surname: '',
                email: '',
                lang: '',
                password: '',
            });
        }

        axios
        .get(this.usersApiUrl+`/${this.$route.params.user_id}`)
        .then((response) => {
            return (this.user = response.data[0]);
        })
    },   
    methods: {
        save () {
            if(this.$route.params.user_id == 'new'){
                var newUser = {
                    name: this.user.name,
                    nickname: this.user.nickname,
                    surname: this.user.surname,
                    email: this.user.email,
                    lang: this.user.lang,
                    password: this.encryptPassword(this.user.password),
                };
                axios.post(this.usersApiUrl, newUser)
                .then(()=>{
                    this.$router.push("/admin/users")
                })
            }else{
                var updatedUser = {
                    name: this.user.name,
                    nickname: this.user.nickname,
                    surname: this.user.surname,
                    email: this.user.email,
                    lang: this.user.lang,
                    password: this.encryptPassword(this.user.password),
                };
                axios.put(this.usersApiUrl+`/${this.$route.params.user_id}`, updatedUser)
                .then(()=>{
                    this.$router.push("/admin/users")
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
