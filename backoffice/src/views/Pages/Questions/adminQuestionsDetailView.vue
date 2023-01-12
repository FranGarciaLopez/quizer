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
                                                    <translatable-input class="form-control mb-4" required  ref="questionTextField"    :text="this.question.text" labelText="Question Text"/>
                                                    <result-input       class="form-control"      required  ref="questionAnswersField" :answers="this.question.answers"/>
                                                </div>
                                                <div class="buttons">
                                                    <router-link :to="{ name: 'adminQuestionsView' }">
                                                        <button type="submit" class=" btn btn-secondary btn-cancel text-uppercase fw-bold mr-1">
                                                            Cancel
                                                        </button>
                                                    </router-link>
                                                    <button type="submit" class="btn btn-primary btn-save text-uppercase fw-bold">
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
    name:"adminQuestionsDetailView", 
    data: () => ({
        question: '',
        ApiUrl: 'http://localhost:3000',
        error: false,
    }),
    components: {
        Sidebar,
        Breadcrumb,
        TranslatableInput,
        ResultInput,
    },
    mounted() {
        if (this.$route.params.question_id === 'new'){
            return (
                this.question = {
                    text: {  es: ''},
                    answers: [{
                        result: {
                            right: this.$refs.questionAnswersField.$.components.ResultValue.props.result.right,
                            total: this.$refs.questionAnswersField.$.components.ResultValue.props.result.total,
                        },
                        text: { es: ''}
                    }]    
                }
            );
        }
        this.fetchData()
    },
    methods: {
        fetchData() {
            axios
            .get(this.ApiUrl+`/paths`+`/${this.$route.params.path_id}`+`/tests`+`/${this.$route.params.test_id}`+`/questions`+`/${this.$route.params.question_id}`)
            .then((response) => {
                this.question = response.data[0]
            })
        },
        save () {
            var updatedInfo = {
                text: this.$refs.questionTextField.getValue(),
                answers: this.$refs.questionAnswersField.getValue(),
                test_id: this.$route.params.test_id,
            };
            if(this.$route.params.question_id === 'new') {
                axios.post(this.ApiUrl+`/questions`, updatedInfo)
                .then(() => {
                    this.$router.push('/admin/paths'+`/${this.$route.params.path_id}/tests/${this.$route.params.test_id}/questions`)
                })
            }
            else{
                axios.put(this.ApiUrl+`/questions/${this.$route.params.question_id}`, updatedInfo)
                .then(() => {
                    this.$router.push('/admin/paths'+`/${this.$route.params.path_id}/tests/${this.$route.params.test_id}/questions` )
                })
            }
        },
    },
    computed:{
        ...authComputed
    },
}
</script>