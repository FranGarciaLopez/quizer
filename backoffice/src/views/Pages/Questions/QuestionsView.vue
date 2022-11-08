<template>
  <div class="main_content">
    <Breadcrumb />
    <Sidebar>
      <template v-slot:body>
        <div class="content">
          <div v-if="loggedIn">
            <div class="d-flex flex-row-reverse">
              <!-- <router-link to="/questionsDetailView"><button  class="btn btn-success float-left btn-lg">Add question <i class="bi bi-plus-square"></i></button></router-link> -->
            </div>
            <br />
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
                              Edit <i class="bi bi-list-ol"></i>
                            </button>
                          </router-link>
                          <button class="btn btn-outline-danger"><i class="bi bi-trash"></i></button>
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
        .catch((error) => console.log(error));
    },
  },
  computed: {
    ...authComputed,
  },
};
</script>;