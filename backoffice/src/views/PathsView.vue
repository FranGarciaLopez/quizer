<template>
  <div class="paths">
    <Sidebar />
    <div class="content">
        Paths
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { authComputed } from "../store/helpers.js";
import Sidebar from "../components/Sidebar.vue";
export default {
  name: "pathsView",
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

<style scoped>
.paths {
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


</style>