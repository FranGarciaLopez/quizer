<template>
<div class="main_content">
        <Breadcrumb/>
        <Sidebar>
            <template v-slot:body>
                <div class="content">
                    <h1 v-if="$route.params.question_id === 'new'">
                        Add new question
                    </h1>
                    <h1 v-else>
                        Edit question {{$route.params.question_id}}
                    </h1>
                    <form @submit.prevent="save">
                        <div>
                            <label class="form-label">Question: 
                            </label><translatable-input class="form-control" :text="this.question.text"/>
                            <br>
                            <label class="form-label">Answers: </label>
                            <result-input class="form-control" :answers="this.question.answers"/>
                        </div>
                    </form>
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