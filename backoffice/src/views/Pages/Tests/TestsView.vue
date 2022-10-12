<template>
    <div class="main_content">
        <Breadcrumb/>
        <Sidebar>
            <template v-slot:body>
                <div class="content">
                    <div v-if="loggedIn">
                        <h1 v-if="$route.params.id === 'new'">
                            Add new test
                        </h1>
                        <h1 v-else>
                            Test from path {{this.$route.params.id}}
                        </h1>
                        <div class="table-wrapper-scroll-y my-custom-scrollbar" >
                            <div v-if="!tests.length">
                                <h1>There is no data here</h1>
                            </div>
                            <table v-else class="table table-bordered table-striped table-hover mb-0">
                                <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Description</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="test in tests" :key="test">
                                    <th scope="row">{{ test.id }}</th>
                                    <td>
                                    <span>
                                        {{ test.name.es }}
                                    </span>
                                    </td>
                                    <td>
                                    <span>
                                        {{ test.desc.es }}
                                    </span>
                                    </td>
                                    <td>
                                    <span>
                                        <!-- <router-link v-bind:to="`${this.$route.path}/tests`"><button class="btn btn-secondary"><i class="fa-solid fa-pen-to-square"></i></button></router-link> -->
                                        <div class="space"></div><!-- 
                                        <button @click="deleteTest(test.id)" class="btn btn-danger"><i class="fa-solid fa-trash-can"></i></button> -->
                                    </span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
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
            .get(this.ApiUrl+`/paths/`+ `${this.$route.params.id}`+'/tests')
            .then((response) => this.tests = response.data)
            .catch((error) => console.log(error));
        }
    },
    computed: {
        ...authComputed,
    },
}
</script>
