<template>
    <div class="main_content">
        <Breadcrumb/>
        <Sidebar>
            <template v-slot:body>
                <div class="content">
                    <div v-if="loggedIn">
                        <h1 v-if="$route.params.path_id === 'new'">
                            Add new path
                        </h1>
                        <h1 v-else>
                            Edit path {{$route.params.path_id}}
                        </h1>
                        <form @submit.prevent="save">
                            <div class="form-group mb-3">
                                <label class="form-label">Name: </label>
                                <translatable-input class="form-control" ref="nameField" :text="path.name"/>
                            </div>

                            <div class="form-group mb-3">
                                <label class="form-label">Description: </label>
                                <translatable-input class="form-control" ref="descField" :text="path.desc"/>
                            </div>
                            
                            <div class="buttons">
                                <router-link :to="{name:'pathsView'}">
                                    <button type="submit" class="btn btn-secondary col-form-label col-md-6">
                                        Cancel
                                    </button>
                                </router-link>
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
        .catch((error) => console.log(error));

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
