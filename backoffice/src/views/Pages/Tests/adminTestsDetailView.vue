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
                                    <div class="col-sm-9 col-md-7 col-lg-6 mx-auto">
                                        <div class="card border-0 shadow rounded-3 my-5">
                                            <div class="card-body p-4 p-sm-10">
                                            <h5 v-if="$route.params.test_id === 'new'">
                                                Add new test
                                            </h5>
                                            <h5 v-else>
                                                Edit tests {{ this.$route.params.test_id }}
                                            </h5>
                                            <form @submit.prevent="save">
                                                <div class="form-group mb-4">
                                                    <translatable-input class="form-control" required ref="nameField" :text="test.name" labelText="Name"/>
                                                </div>
                                                <div class="form-group mb-4">
                                                    <translatable-input class="form-control" required ref="descField" :text="test.desc" labelText="Description"/>
                                                </div>
                                                <div class="buttons">
                                                    <router-link :to="{ name: 'adminTestsView' }">
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
import axios from "axios";
import TranslatableInput from "@/components/TranslatableInput.vue";
import Breadcrumb from "@/components/BreadCrumb.vue";
import Sidebar from "@/components/Sidebar.vue";
import { authComputed } from "@/store/helpers.js";

export default {
    name: "adminTestsDetailView",
    data: () => ({
        ApiUrl: "http://localhost:3000",
        path: "",
        test: "",
    }),
    components: {
        Sidebar,
        Breadcrumb,
        TranslatableInput,
    },
    mounted() {
        if (this.$route.params.test_id === "new") {
            return (this.test = {
                name: { es: "" },
                desc: { es: "" },
            });
        }
        /* tests-questions (axios) */
        this.fetchData();
    },
    methods: {
        async fetchData() {
            await axios
            .get(this.ApiUrl+`/paths`+`/${this.$route.params.path_id}`+`/tests`+`/${this.$route.params.test_id}`)
            .then((response) => {
                return (this.test = response.data[0]);
            });
        },
        save() {
            var updatedInfo = {
                name: this.$refs.nameField.getValue(),
                desc: this.$refs.descField.getValue(),
                path_id: this.$route.params.path_id,
            };
            if (this.$route.params.test_id === "new") {
                axios
                .post(this.ApiUrl + `/tests`, updatedInfo)
                .then(() =>
                    this.$router.push("/admin/paths" + `/${this.$route.params.path_id}` + "/tests"));
            } else {
                axios
                .put(this.ApiUrl + `/tests/${this.$route.params.test_id}`, updatedInfo)
                .then(() => this.$router.push("/admin/paths" + `/${this.$route.params.path_id}/tests`));
            }
        },
    },
    computed: {
        ...authComputed,
    },
};
</script>
