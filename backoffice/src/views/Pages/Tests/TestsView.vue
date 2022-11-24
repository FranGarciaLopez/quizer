<template>
    <div class="main_content">
        <Sidebar>
            <template v-slot:body>
                <div class="content">
                    <div v-if="loggedIn">
                        <div class="bg-light">
                            <Breadcrumb/>
                        </div>
                        <div class="card m-4">
                            <div class="card-header bg-white">
                                <ul class="nav nav-pills card-header-pills">
                                    <li class="nav-item">
                                        <router-link class="float-right mb-3 nav-link active" :to="{name: 'testsDetailView', params: {test_id: 'new'}}">Add test <i class="bi bi-plus-square"></i></router-link>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body bg-white">
                                <div class="table-responsive col-sm-12">
                                    <table class="table table-bordered table-striped table-hover mb-0">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Id</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Conclusion</th>
                                            <th scope="col">Number of questions</th>
                                            <th scope="col">Buttons</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr v-for="test in tests" :key="test">
                                            <th scope="row">{{ test.id }}</th>
                                            <td>
                                            <span><router-link  class="link-secondary" v-bind:to="'/paths/'+`${this.$route.params.path_id}/`+'tests/'+test.id">
                                                {{ test.name.es }}
                                            </router-link></span>
                                            </td>
                                            <td>
                                            <span>
                                                {{ test.desc.es }}
                                            </span>
                                            </td>
                                            <td>
                                            <span>
                                                {{ test.conclusion.es }}
                                            </span>
                                            </td>
                                            <td>
                                            <span>
                                                {{ test.question_count }}
                                            </span>
                                            </td>
                                            <td>
                                            <span>
                                                <div class="btn-group">
                                                    <router-link v-bind:to="`/paths`+`/${this.$route.params.path_id}`+`/tests/`+test.id+`/questions`">
                                                        <button class="btn btn-outline-primary">
                                                            <i class="bi bi-list-ol"></i>
                                                        </button>
                                                    </router-link>
                                                    <button @click="deleteTest(test.id)" class="btn btn-outline-danger"><i class="bi bi-trash"></i></button>
                                                </div>
                                            </span>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div v-if="this.tests.length === 0">
                                        <h1>There is no data here</h1>
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
import axios from "axios";
import { authComputed } from "@/store/helpers.js";
import Sidebar from "@/components/Sidebar.vue";
import Breadcrumb from "@/components/BreadCrumb.vue";
export default {
    name:"testsView", 
    data: () => ({
        ApiUrl: 'http://localhost:3000',
        tests: '',
    }), 
    components: {
        Sidebar,
        Breadcrumb,
    },
    mounted() {
        this.fetchData();
    },   
    methods: {
        fetchData(){
            /* path-tests */
            
            axios
            .get(this.ApiUrl+`/paths`+ `/${this.$route.params.path_id}`+'/tests')
            .then((response) => {
                this.tests = response.data;
            })
        },
        deleteTest(testId){
            if(confirm("Do you really want to delete?")){
                axios.delete(this.ApiUrl+`/tests`+`/${testId}`)
                .then(response => {
                    this.tests.splice(testId, 1).push(response.data);
                    this.fetchData();
                });
            }
        }
    },
    computed: {
        ...authComputed,
    },
}
</script>
