<template>
  <div class="main_content">
    <!-- <Sidebar /> -->
    <div class="content">
        Resources
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { authComputed } from "../../../store/helpers.js";
import Sidebar from "../../../components/Sidebar.vue";
export default {
  name: "resourcesView",
  data() {
    return {
      info: null,
    };
  },
  mounted() {
    
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
