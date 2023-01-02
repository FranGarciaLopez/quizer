<template>
<div class="vh-100">
    <div class="row m-3">
        <div class="col-sm-6 mb-3" v-for="(data) in this.text">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">{{data.name.es}}</h5>
                    <p class="card-text">{{data.desc.es}}</p>
                    <section class="col p-0">
                        <hr>
                        <footer class="footer">
                            <slot name="link-button">
                                    <div  class="float-right">
                                        <router-link :to="this.link+`/${data.id}`" v-if="(this.$route.name === 'userTestsView')">
                                            <button class="btn btn-primary btn-lg mr-2" @click="this.insertUserTest(data.id)">{{this.buttonText}}</button>
                                        </router-link>
                                        <router-link :to="this.link+`/${data.id}`" v-else>
                                            <button class="btn btn-primary btn-lg mr-2">{{this.buttonText}}</button>
                                        </router-link>
                                    </div>
                                    <div class="float-left">
                                        <h3 v-if="data.acc_results && (Object.keys(data.acc_results).length !== 0) && (this.$route.name === 'userTestsView')">
                                            Score: {{data.acc_results.right}}/{{data.acc_results.total}}
                                        </h3>
                                        <h3 v-else-if="this.$route.name === 'userTestsView'">
                                            You have not done the test yet.
                                        </h3>
                                    </div>
                            </slot>
                        </footer>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import axios from "axios";

export default {
    name: 'cardView',
    data() {
        return {
            ApiUrl: "http://localhost:3000",
        };
    },
    props: {
        text: {
            type: Object,
        },
        buttonText:{
            type: String,
        },
        link: {
            type: String,        
        }
    },
    methods: {
        insertUserTest(testId) {
            axios.post(this.ApiUrl + `/users/${this.$route.params.user_id}/tests/${testId}`);
            
        },
    }
}
</script>
