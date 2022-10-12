<template>
  <div class="main_content">
    <Breadcrumb/>
    <Sidebar>
      <template v-slot:body>
        <div class="content">
          <div v-if="loggedIn">
            <router-link to="/users/new"><button class="btn btn-large btn-block btn-success">Add User <i class="bi bi-plus"></i></button></router-link>
            <div class="table-wrapper-scroll-y my-custom-scrollbar">
              <table class="table table-bordered table-striped table-hover mb-0">
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
                    <th scope="row">{{ user.id }}</th>
                    <td><router-link style="text-decoration: none; color: black" v-bind:to="'/users/'+user.id">
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
  name: "usersView",
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
        .catch(error => console.log(error))
    },
    deleteUser(userId) {
      axios.delete(this.usersApiUrl+`/${userId}`)
      .then(response => {
        this.fetchArticles();
        return  response;
      });
    },
  },
  computed: {
    ...authComputed,
  },
};
</script>;