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
                                <div class="col-sm-9 col-md-7 col-lg-6 mx-auto">
                                    <div class="card border-0 shadow rounded-3 my-5">
                                        <div class="card-body p-4 p-sm-10">
                                            <h5 v-if="$route.params.path_id === 'new'">
                                                Add new path
                                            </h5>
                                            <h5 v-else>
                                                Edit path {{$route.params.path_id}}
                                            </h5>
                                            <form @submit.prevent="save">

                                                <div class="form-group mb-3">
                                                    <translatable-input class="formName form-control" required ref="nameField" :text="path.name" labelText="Name" />
                                                </div>
                                                <div class="form-group mb-3">
                                                    <translatable-input class="formDesc form-control" required ref="descField" :text="path.desc" labelText="Description"/>
                                                </div>
                                                
                                                <div class="buttons">
                                                    <router-link :to="{name:'pathsView'}">
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
import axios from "axios";
import TranslatableInput from '@/components/TranslatableInput.vue';
import Breadcrumb from '@/components/BreadCrumb.vue';
import Sidebar from '@/components/Sidebar.vue';
import {authComputed} from '@/store/helpers.js';

export default {
    name:"pathDetailView", 
    data: () => ({
        pathsApiPath: 'http://localhost:3000',
        path:'',
    }), 
    components: {
        TranslatableInput,
        Sidebar,
        Breadcrumb,
    },
    mounted() {
        if (this.$route.params.path_id === 'new'){
            return (this.path = {name: {en: ''}, desc: {en: ''}});
        }

        axios
        .get(this.pathsApiPath+`/paths/${this.$route.params.path_id}`)
        .then((response) => {
            return (this.path = response.data[0]);
        })

    },   
    methods: {
        save () {
            var updatedInfo = {
                name: this.$refs.nameField.getValue(),
                desc: this.$refs.descField.getValue(),
            };
            if(this.$route.params.path_id === 'new') {
                axios.post(this.pathsApiPath+`/paths`, updatedInfo)
                .then((data) => this.$router.push(`/paths`))
            }
            else{
                axios.put(this.pathsApiPath+`/paths/${this.$route.params.path_id}`, updatedInfo)
                .then(() => {
                    alert('Updated')
                    this.$router.push(`/paths/${this.$route.params.path_id}`)
                })
            }
        },
    },
    computed:{
        ...authComputed
    },
}
</script>
