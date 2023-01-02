<template>
    <div class="main_content">
        <div class="content m-0 p-0">
            <div v-if="loggedIn">
              <div class="bg-light">
                <NavView/>
              </div>
              <div>
                <card-view :text="this.user_paths" buttonText="Tests" :link="`${this.$route.fullPath}`"/>
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
  name: "userPathsView",
  data() {
    return {
      ApiUrl: "http://localhost:3000",
      user_paths: [],
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
      const user_id = JSON.parse(localStorage.user).user_id
      axios
        .get(this.ApiUrl+`/users/${user_id}/paths`)
        .then(response => {
          this.user_paths = response.data
        })
    },
  },
  computed: {
    ...authComputed,
  },
};
</script>;