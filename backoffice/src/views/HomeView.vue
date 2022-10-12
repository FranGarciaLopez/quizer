<template>
  <div class="main_content">
    <Breadcrumb/>
    <Sidebar>
      <template v-slot:body>
        <div class="content">
          <div v-if="loggedIn">
            <img src="../assets/Fondo.png" style="width: 100%; height:100%;">
          </div>  
        </div>
      </template>
    </Sidebar>
  </div>
  
</template>;

<script>
import Sidebar from '@/components/Sidebar.vue';
import Breadcrumb from '@/components/BreadCrumb.vue';
import {authComputed} from '@/store/helpers.js';
export default {
  name: 'homeView',
  computed:{
    ...authComputed
  },
  components:{
    Sidebar,
    Breadcrumb,
  },
}
</script>
