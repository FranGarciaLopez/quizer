<template>
  <div class="main_content">
    <Breadcrumb/>
    <Sidebar>
      <template v-slot:body>
        <div class="content">
          <div v-if="loggedIn">
            <router-link class="float-right mb-3" to="/paths/new"><button class="btn btn-success">Add Path <i class="bi bi-plus-square"></i></button></router-link>
            <div  class="table-wrapper-scroll-y my-custom-scrollbar table-responsive-md">
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
                  <tr v-for="(path) in paths" :key="path">
                    <th scope="row">{{ path.id }}</th>
                    <td><router-link class="link-secondary" v-bind:to="'/paths/'+path.id">
                      <span>
                        {{ path.name.es }}
                      </span>
                    </router-link></td>
                    <td>
                      <span>
                        {{ path.desc.es }}
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
                          <router-link class="styledLink" v-bind:to="'/paths/'+path.id+'/tests'">
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
  name: "pathsView",
  data() {
    return {
      ApiUrl: "http://localhost:3000",
      paths: null,
      testCount: null,
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
        .catch(error => console.log(error))
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
  },
};
</script>;
