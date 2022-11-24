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
                    <router-link class="float-right mb-3 nav-link active" :to="{name: 'questionsDetailView', params: {question_id: 'new'}}">Add question <i class="bi bi-plus-square"></i></router-link>
                  </li>
                </ul>
              </div>
              <div class="card-body bg-white">
                <div class="table-responsive col-sm-12">
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
                      <tr v-for="(question, index) in questions" :key="question">
                        <td>{{ question.id }}</td>
                        <td>
                          <span>
                              {{ question.text.es }}
                          </span>
                        </td>
                        <td>
                          <span v-for="(answers, index2) in questions[index].answers" :key="answers">
                            <ol>
                              {{ questions[index].answers[index2].text.es }}
                            </ol>
                          </span>
                        </td>
                        <td>
                          <span>
                            <div class="btn-group">
                              <router-link v-bind:to="`/paths`+`/${this.$route.params.path_id}`+`/tests/`+`${this.$route.params.test_id}`+`/questions/`+question.id">
                                <button class="btn btn-outline-primary">
                                  Edit <i class="bi bi-pencil-square"></i>
                                </button>
                              </router-link>
                              <button @click="deleteQuestion(question.id)" class="btn btn-outline-danger"><i class="bi bi-trash"></i></button>
                            </div>
                          </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                  <div v-if="!this.questions.length">
                      <h1>There is no data here</h1>
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
import { authComputed } from "@/store/helpers.js";
import Sidebar from "@/components/Sidebar.vue";
import Breadcrumb from "@/components/BreadCrumb.vue";
export default {
  name: "questionsView",
  data() {
    return {
      ApiUrl: "http://localhost:3000",
      questions: "",
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
    fetchData() {
      axios
        .get(this.ApiUrl+`/paths`+`/${this.$route.params.path_id}`+`/tests`+`/${this.$route.params.test_id}`+`/questions`)
        .then((response) => {this.questions = response.data;})
    },
    deleteQuestion(questionId) {
      if(confirm("Do you really want to delete?")){
        axios.delete(this.ApiUrl+`/questions`+`/${questionId}`)
        .then(response => {
          this.questions.splice(questionId, 1).push(response.data);
          this.fetchData();
        });
      }
    }
  },
  computed: {
    ...authComputed,
  },
};
</script>;