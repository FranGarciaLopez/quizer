<template>
    <div class="main_content">
        <Sidebar>
            <template v-slot:body>
                <div class="content">
                    <div v-if="loggedIn">
                        <div class="bg-light">
                            <Breadcrumb />
                        </div>
                        <div class="pr-4 content d-flex flex-column min-vh-99 justify-content-center">
                            <div class="row">
                                <div class="col-sm-12 col-md-7 col-lg-10 mx-auto">
                                    <div class="card border-0 shadow rounded-3 my-5">
                                        <div class="card-body p-4 p-sm-12">
                                            <h1 v-if="$route.params.question_id === 'new'">
                                                Add new question
                                            </h1>
                                            <h1 v-else>
                                                Edit question {{$route.params.question_id}}
                                            </h1>
                                            <form @submit.prevent="save">
                                                <div class="form-group mb-4">
                                                    <translatable-input class="form-control mb-4" required ref="questionTextField" :text="this.question.text" labelText="Question Text"/>
                                                    <result-input class="form-control" ref="questionAnswersField" :answers="this.question.answers"/>
                                                </div>
                                                <div class="buttons">
                                                    <router-link :to="{ name: 'questionsView' }">
                                                        <button type="submit" class=" btn btn-secondary btn-login text-uppercase fw-bold mr-1">
                                                            Cancel
                                                        </button>
                                                    </router-link>
                                                    <button type="submit" class="btn btn-primary btn-login text-uppercase fw-bold">
                                                        Save
                                                    </button>
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
import TranslatableInput from '@/components/TranslatableInput.vue';
import ResultInput from '@/components/ResultInput.vue';
import Breadcrumb from '@/components/BreadCrumb.vue';
import Sidebar from '@/components/Sidebar.vue';
import {authComputed} from '@/store/helpers.js';
import axios from "axios";
export default {
    name:"questionsDetailView", 
    data: () => ({
        question: '',
        ApiUrl: 'http://localhost:3000',
        error: false
    }),
    components: {
        Sidebar,
        Breadcrumb,
        TranslatableInput,
        ResultInput,
    },
    mounted() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            axios
            .get(this.ApiUrl+`${this.$route.fullPath}`)
            .then((response) => {
                this.question = response.data[0]
            })
            .catch((error) => console.log(error));
        },
       /*  addUser () {
            var questionData = {
             QuestionData 
            };
            axios.post('http://localhost:3000/users', newUser)
            .then(()=>{
                this.$router.push("/users")
            })
        }, */
    },
    computed:{
        ...authComputed
    },
}
</script>