<template>
    <div class="main_content">
        <Breadcrumb/>
        <Sidebar>
            <template v-slot:body>
                <div class="content">
                    <div v-if="loggedIn">
                        <h1 v-if="$route.params.test_id === 'new'">
                            Add new path
                        </h1>
                        <h1 v-else>
                            Edit tests {{this.$route.params.test_id}}
                        </h1>
                        <form @submit.prevent="save">
                            <div class="form-group mb-3">
                                <label class="form-label">Name: </label>
                                <translatable-input class="form-control" ref="nameField" :text="test.name"/>
                            </div>

                            <div class="form-group">
                                <label class="form-label" name="description">Description: </label>
                                <translatable-input class="form-control" ref="descField" :text="test.desc"/>
                            </div>
                            <div class="buttons">
                                <router-link :to="{name: 'testsDetailView', params: { path_id: this.$route.params.path_id, test_id: this.$route.params.test_id }}"><button type="submit" class="btn btn-danger col-form-label col-md-6">Cancel</button></router-link>
                                <span><button type="submit" class="btn btn-primary col-md-6">Save</button></span>
                            </div>
                        </form>

                    </div>
                </div>
            </template>
        </Sidebar>
    </div>
</template>

<script>
import axios from "axios";
import TranslatableInput from '@/components/TranslatableInput.vue';
import Breadcrumb from '@/components/BreadCrumb.vue';
import Sidebar from '@/components/Sidebar.vue';
import {authComputed} from '@/store/helpers.js';

export default {
    name:"testsDetailView", 
    data: () => ({
        ApiUrl: 'http://localhost:3000',
        path:'',
        test: '',
    }), 
    components: {
        Sidebar,
        Breadcrumb,
        TranslatableInput,
    },
    mounted() {
        if (this.$route.params.id === 'new'){
            return (this.test = {name: {  v: ''}, desc: {en: ''}});
        }
        /* tests-questions (axios) */
        this.fetchData();
    },   
    methods: {
        fetchData(){
            axios
            .get(this.ApiUrl+`/paths/`+`${this.$route.params.path_id}`+`/tests/`+`${this.$route.params.test_id}`)
            .then((response) => {
                return (this.test = response.data[0]);
            })
            .catch((error) => console.log(error));
        },
        /* save () {
            var updatedInfo = {
                name: this.$refs.nameField.getValue(),
                desc: this.$refs.descField.getValue(),
            };
            if(this.$route.params.id === 'new') {
                axios.post(this.ApiUrl, updatedInfo)
                .then((data) => this.$router.push(`/path`))
            }
            else{
                axios.put(this.ApiUrl+`/paths/${this.$route.params.path_id}`, updatedInfo)
                .then(() => this.$router.push(`/path/${this.$route.params.path_id}`))
            }
        }, */
    },
    computed:{
        ...authComputed
    },
}
</script>
