<template>
  <div class="main_content">
    <Sidebar />
    <div class="content">
      <div v-if="loggedIn">
        <div class="d-flex flex-row-reverse">
          <router-link to="/addTopic"><button class="btn btn-success float-left btn-lg">Add Topic <i class="fa-solid fa-plus"></i></button></router-link>
        </div>
        <br>
        <div class="table-wrapper-scroll-y my-custom-scrollbar">
          <table class="table table-bordered table-striped table-hover mb-0">
            <thead>
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Buttons</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(topic, index) in topics" :key="topic">
                <td>{{ topic.topic_id }}</td>
                <td>
                  <span v-if="updateForm && newId == topic.topic_id">
                    <input v-model="newName" type="text" class="form-control" :placeholder="[[topic.name]]" />
                  </span>
                  <span v-else>
                    {{ topic.name }}
                  </span>
                </td>
                <td>
                  <span v-if="updateForm && newId == topic.topic_id">
                    <button @click="saveUpdate(topic.topic_id)" class="btn btn-success">
                      <i class="fa-solid fa-floppy-disk"></i>
                    </button>
                  </span>
                  <span v-else>
                    <button @click="viewUpdateForm(index)" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i></button>

                    <div class="space"></div>
                    <button @click="deleteTopic(index)" class="btn btn-danger"><i class="fa-solid fa-trash-can"></i></button>
                  </span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { authComputed } from "../../../store/helpers.js";
import Sidebar from "../../../components/Sidebar.vue";
export default {
  name: "topicsView",
  data() {
    return {
      info: null,
      topics: null,
      updateForm: false,
    };
  },
  mounted() {
    axios
      .get("http://localhost:3000/topics")
      .then((response) => (this.topics = response.data))
      .catch((error) => console.log(error));
  },
  components: {
    Sidebar,
  },
  methods: {
    deleteTopic(topicId) {
      axios.delete(`http://localhost:3000/topics/${topicId}`);
      window.location.reload();
    },
    viewUpdateForm(topicId) {
      this.newId = this.topics[topicId].topic_id;
      this.newName = this.topics[topicId].name;
      this.updateForm = true;
    },
    saveUpdate(topicId) {
      let self = this;
      this.updateForm = false;
      var updatedTopic = {
        name: this.newName,
      };
      axios
        .put(`http://localhost:3000/topics/${topicId}`, updatedTopic)
        .then(function (response) {
          const status = JSON.stringify(response.status);
          if (status == "200") {
            var topic = self.topics.find((topic) => topic.topic_id === topicId);
            topic.name = updatedTopic.name;
          }
        });
    },
  },
  computed: {
    ...authComputed,
  },
};
</script>;
