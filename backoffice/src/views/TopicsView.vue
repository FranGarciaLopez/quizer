<template>
  <div class="topics">
    <Sidebar />
    <div class="content">
      <div class="topic_data">
        <table class="table table-hover">
          <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Name</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="topic in info" :key="topic">
              <td>{{ topic.topic_id }}</td>
              <td>{{ topic.name }}</td>
              <td>
                
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { authComputed } from "../store/helpers.js";
import Sidebar from "../components/Sidebar.vue";
export default {
  name: "topicsView",
  data() {
    return {
      info: null,
    };
  },
  mounted() {
    axios.get("http://localhost:3000/topics").then((response) => (
      this.info = response.data
    )).catch((error) => console.log(error));
  },
  components: {
    Sidebar,
  },
  methods: {
    
  },
  computed: {
    ...authComputed,
  },
};
</script>;

<style scoped>
.topics {
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

.topic_data {
  margin: 20px 20px;
}
</style>