<template>
    <div class="main_content">
        <div class="content">
            <div v-if="loggedIn">
              <div class="bg-light">
                  <Breadcrumb/>
              </div>
              <card-view :text="this.user_path_tests" buttonText="Questions" :link="`${this.$route.fullPath}/test`"/>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import { authComputed } from "@/store/helpers.js";
import CardView from "@/components/CardView.vue";
import Breadcrumb from "@/components/BreadCrumb.vue";
export default {
  name: "userTestsView",
  data() {
    return {
      ApiUrl: "http://localhost:3000",
      user_path_tests: '',
    };
  },
  mounted() {
    this.fetchData();
  },
  components: {
    CardView,
    Breadcrumb,
  },
  methods: {
    fetchData(){
      debugger
      axios
        .get(this.ApiUrl+`/user/${this.$route.params.user_id}/paths`+ `/${this.$route.params.path_id}/tests`)
        .then(response => {
          debugger
            this.user_path_tests = response.data
        })
    },
    /* deletePath(pathId) {
      if(confirm("Do you really want to delete?")){
        axios.delete(this.ApiUrl+`/paths`+`/${pathId}`)
        .then(response => {
          this.paths.splice(pathId, 1).push(response.data);
          this.fetchData();
        });
      }
    }, */
  },
  computed: {
    ...authComputed,
  },
};
</script>;