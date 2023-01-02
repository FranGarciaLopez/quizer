<template>
  <div class="main_content">
    <div class="content vh-100">
      <div v-if="loggedIn">
        <div class="bg-light">
          <NavView/>
        </div>
        <div class="card m-4">
          <div class="card-body bg-white" v-if="this.next_question.length === 0">
            <h2>{{this.message = "Click next button to start the text."}}</h2>
            <div class="card-footer bg-white">
              <button class="btn-lg btn-secondary" @click="this.getNextQuestion()">Next <i class="bi bi-arrow-right"></i></button>
            </div>
          </div>
          <div class="card-body bg-white" v-for="(value, index) in this.next_question" v-else>
            <h2>{{value.text.es}}</h2>
            <div class="btn-group-vertical btn-group-toggle" v-for="(key, index2) in value.answers">
              <div class="mr-2">
                <label class="btn btn-outline-primary btn-lg block" ref="answerField" @change="this.getNextQuestion(index2)">
                  <input type="radio" name="answers" id="answers" class="custom-control-input"> 
                    {{key.text.es}}
                </label>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { authComputed } from "@/store/helpers.js";
import CardView from "@/components/CardView.vue";
import NavView from "../NavView.vue"
export default {
  name: "userQuestionsView",
  data() {
    return {
      ApiUrl: "http://localhost:3000",
      next_question: '',
      last_question: '',
      next_id: 0,
      message: '',
    };
  },
  mounted() {
    axios
      .get(this.ApiUrl+`/users/${this.$route.params.user_id}/paths/${this.$route.params.path_id}/tests/${this.$route.params.test_id}/last_question`)
      .then(response => {
        this.last_question = response.data[0];
      });
  },
  components: {
    CardView,
    NavView,
  },
  methods: {
    getNextQuestion(selectedIndex) {
      this.next_id += 1;
      axios
        .get(this.ApiUrl+`/users/${this.$route.params.user_id}/paths/${this.$route.params.path_id}/tests/${this.$route.params.test_id}/questions/${this.next_id}`)
        .then(response => {
          this.next_question = response.data;
        });
      if(this.next_question.length !== 0){
        this.insertAnswers(selectedIndex);
        document.querySelectorAll('input[type="radio"]').forEach(input => input.checked = false);
      }
      if(this.next_id > this.last_question.order){
        axios
          .put(this.ApiUrl+`/users/${this.$route.params.user_id}/tests/${this.$route.params.test_id}`)
        this.$router.push({name:'userTestsView'})
      }
    },
    insertAnswers(selectedIndex) {
      var updatedInfo = {
        user_id: this.$route.params.user_id,
        path_id: this.$route.params.path_id,
        test_id: this.$route.params.test_id,
        question_id: this.next_question.id,
        answer: {
          right: this.next_question[0].answers[selectedIndex].result.right,
          total: this.next_question[0].answers[selectedIndex].result.total,
        },
      };
      axios
        .post(this.ApiUrl+`/users/${this.$route.params.user_id}/tests/${this.$route.params.test_id}/questions/${this.next_question[0].id}`, updatedInfo);
    },
  },
  computed: {
    ...authComputed,
  },
};
</script>;