<template>
    <div class="main_content">
        <div class="content">
            <div v-if="loggedIn">
              <div class="bg-light">
                <NavView/>
              </div>
              <card-view :text="this.user_tests" buttonText="Questions" :link="`${this.$route.fullPath}/test`" v-on:testCompleted="fetchData"/>
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
  name: "userTestsView",
  data() {
    return {
      ApiUrl: "http://localhost:3000",
      user_tests: [],
    };
  },
  mounted() {
    this.fetchData();
  },
  components: {
    CardView,
    NavView,
  },
  methods: {
    fetchData(){
      axios
        .get(this.ApiUrl+`/user/${this.$route.params.user_id}/paths/${this.$route.params.path_id}/tests`)
        .then(response => {
          this.user_tests = response.data
        })
    },
  },
  computed: {
    ...authComputed,
  },

};
</script>;