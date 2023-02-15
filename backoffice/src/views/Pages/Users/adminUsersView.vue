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
                    <router-link class="float-left m-2 nav-link active" to="/admin/users/new">Add User <i class="bi bi-plus-square"></i></router-link>
                  </li>
                </ul>
              </div>
              <div class="card-body bg-white">
                <div class="table-responsive col-sm-12">
                  <table class="table table-bordered table-striped table-hover mb-0 table-sm">
                    <thead class="thead-dark">
                      <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Surname</th>
                        <th scope="col">Nickname</th>
                        <th scope="col">Button</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="(user) in users" :key="user">
                        <th scope="row row-md-12">{{ user.id }}</th>
                        <td><router-link class="link-secondary" v-bind:to="'/admin/users/'+user.id">
                          <span>
                            {{ user.name }}
                          </span>
                          </router-link>
                        </td>
                        <td>
                          <span>
                            {{ user.surname }}
                          </span>
                        </td>
                        <td>
                          <span>
                            {{ user.nickname }}
                          </span>
                        </td>
                        <td>
                          <span>
                            <button @click="deleteUser(user.id)" class="btn btn-danger"><i class="bi bi-trash"></i></button>
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
  name: "adminUsersView",
  data() {
    return {
      usersApiUrl: "http://localhost:3000/users",
      users: null,
    };
  },
  mounted() {
    this.fetchData();
  },
  components: {
    Sidebar,
    Breadcrumb
  },
  methods: {
    fetchData(){
      axios
        .get(this.usersApiUrl)
        .then(response => (this.users = response.data))
    },
    deleteUser(userId) {
      if(confirm("Do you really want to delete?")){
        axios.delete(this.usersApiUrl+`/${userId}`)
        .then(response => {
          this.users.splice(userId, 1).push(response.data);
          this.fetchData()
        });
      }
    },
  },
  computed: {
    ...authComputed,
  },
};
</script>;