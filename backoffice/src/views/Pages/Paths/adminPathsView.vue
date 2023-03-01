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
                    <router-link class="float-right m-2 nav-link active" to="/admin/paths/new">Add Path <i class="bi bi-plus-square"></i></router-link>
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
                        <th scope="col">Type</th> 
                        <th scope="col">Number of tests</th> 
                        <th scope="col">Buttons</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="(path) in  this.paths" :key="path">
                        <th scope="row">{{ path.id }}</th>
                        <td><router-link class="link-secondary" v-bind:to="'/admin/paths/'+path.id">
                          <span>
                            {{ path.name[userLang] }}
                          </span>
                        </router-link></td>
                        <td>
                          <span>
                            {{ path.desc[userLang] }}
                          </span>
                        </td>
                        <td>
                          <span>
                            {{ path.type }}
                          </span>
                        </td>
                        <td>
                          <span>
                            {{ path.test_count }}
                          </span>
                        </td>
                        <td>
                          <span>
                            <div class="btn-group">
                              <router-link class="styledLink" v-bind:to="'/admin/paths/'+path.id+'/tests'">
                                <button class="btn btn-outline-primary">
                                  <i class="bi bi-list-ol"></i>
                                </button>
                              </router-link>
                              <button @click="deletePath(path.id)" class="btn btn-outline-danger"><i class="bi bi-trash"></i></button>
                            </div>
                          </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
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
  name: "adminPathsView",
  data() {
    return {
      ApiUrl: "http://localhost:3000",
      paths: '',
    };
  },
  mounted() {
    this.fetchData();
  },
  components: {
    Sidebar,
    Breadcrumb,
  },
  methods: {
    fetchData(){
      axios
        .get(this.ApiUrl+`/paths`)
        .then(response => {
          this.paths = response.data
        })
    },
    deletePath(pathId) {
      if(confirm("Do you really want to delete?")){
        axios.delete(this.ApiUrl+`/paths`+`/${pathId}`)
        .then(response => {
          this.paths.splice(pathId, 1).push(response.data);
          this.fetchData();
        });
      }
    },
  },
  computed: {
    ...authComputed,
    userLang() {
      let lang = JSON.parse(localStorage.user).lang
      return lang;
    }
  },
};
</script>;