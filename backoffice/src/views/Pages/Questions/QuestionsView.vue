<template>
  <div class="main_content">
    <Sidebar />
    <div class="content">
        <div v-if="loggedIn" >
        <div class="d-flex flex-row-reverse">
          <router-link to="/addQuestion"><button  class="btn btn-success float-left btn-lg">Add question <i class="fa-solid fa-plus"></i></button></router-link>
        </div>
        <br>
        <div class="table-wrapper-scroll-y my-custom-scrollbar">
          <table class="table table-bordered table-striped table-hover mb-0">
            <thead class="thead-dark">
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Text</th>              
                <th scope="col">Answers</th>
                <th scope="col">Buttons</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(question ,index) in questions" :key="question">
                <td>{{ question.id }}</td>
                <td>
                  <span>
                    {{ question.text.es }}
                  </span>
                </td>
                <td>
                  <span v-for="(answers ,index2) in questions[index].answers" :key="answers">
                    {{ questions[index].answers[index2].text.es }}
                    <br>
                  </span>
                </td>
                <td>
                  <span v-if="updateForm && newId == path.id">
                      <button class="btn btn-success"><i class="fa-solid fa-floppy-disk"></i></button>
                  </span>

                  <span v-else>
                    <button class="btn btn-secondary"><i class="fa-solid fa-pen-to-square"></i></button>
                    <button class="btn btn-danger"><i class="fa-solid fa-trash-can"></i></button>
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
  name: "questionsView",
  data() {
    return {
      questions: null,
      name: '',
    };
  },
  mounted() {
    axios.get("http://localhost:3000/questions").then((response) => {
      return this.questions = response.data
    }).catch((error) => console.log(error));
  },
  components: {
    Sidebar,
  },
  methods: {
      get(){
        axios.get("http://localhost:3000/questions").then((response) => {
          return this.questions = response.data
        }).catch((error) => console.log(error));
      }
  },
  computed: {
    ...authComputed,
  },
};
</script>;