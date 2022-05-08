<template>
  <div class="users">
    <Sidebar />
    <div class="content">
      <div class="user_data">
        
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Name</th>
              
              <th></th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in users" :key="user">
              <td>{{ user.id }}</td>
              <td>
                <span v-if="updateForm && newId == user.id">
                  <input v-model="newName" type="text" class="form-control">
                </span>
                <span v-else>
                  {{ user.name }}
                </span>
              </td>
              <td>
                <span v-if="updateForm && newId == user.id">
                  <button @click="saveUpdate(user.id)" class="btn btn-success">Guardar</button>
                </span>
                <span v-else>
                  <button @click="viewUpdateForm(user.id)" class="btn btn-primary">Actualizar</button>
                  <div class="space"></div>
                  <button @click="deleteUser(user.id)" class="btn btn-danger">Borrar</button>
                </span>
              </td>
            </tr>
          </tbody>
        </table>
        <!-- <section class="form">
          <form action="" class="text-center">
            <input v-model="name" @keyup.enter="addUser" type="text" class="form-control" placeholder="Name">
            
            <input @click="addUser" type="button" value="Add" class="btn btn-success">
          </form>
        </section> -->
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { authComputed } from "../store/helpers.js";
import Sidebar from "../components/Sidebar.vue";
export default {
  name: "usersView",
  data() {
    return {
      users: null,
      name: '',
      updateForm: false,
    };
  },
  mounted() {
    axios.get("http://localhost:3000/users").then((response) => (
      this.users = response.data
    )).catch((error) => console.log(error));
  },
  components: {
    Sidebar,
  },
  methods: {
    deleteUser(userId) {
      axios.delete(`http://localhost:3000/users/${userId}`)
    },
    viewUpdateForm(userId) {
      this.newId = userId;
      this.newName = this.users.name;
      this.updateForm = true;
    },
    saveUpdate(userId) {
      let self = this;
      this.updateForm = false;
      this.users.name = this.newName;
      axios.put(`http://localhost:3000/users/${userId}`, {
        name: this.newName,
        surname: this.newName,
        nickname: this.newName, 
        lang: "es",
        email: "frangalo34@gmail.com",
        telegram_id: 3
      }).then(function(response){
        const status = JSON.stringify(response.status);
        if (status == '200') {
          window.location.reload();
        }
      })

    }
    
  },
  computed: {
    ...authComputed,
  },
};
</script>;

<style scoped>
.space {
  width: 4px;
  height: auto;
  display: inline-block;
}
.users {
  display: grid;
  grid-template-columns: 1fr 5fr;
  background-color: teal;
  height: 100vh;
  width: 100%;
}

.content {
  background-color: white;
  border-radius: 20px;
  margin: 6px 6px 6px 0px;
  color: rgb(167, 167, 167);
  
}

.user_data {
  margin: 20px 20px;
}
</style>