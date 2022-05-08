<template>
    <div class="content">
        <h1>This page is protected by auth</h1>
        <div v-if="!loggedIn">
            You can make an account
            <router-link to="/register">
                Register
            </router-link>
            or
            <router-link to="/login">
                Login
            </router-link>
        </div>
    </div>
</template>

<script>
import {authComputed} from '../../store/helpers.js'
export default {
  name: 'secureView',
  computed:{
    ...authComputed
  },
  
}
</script>;

<style scoped>
.content{
    position:fixed;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    width: 40%;
    height: 40%;
}
</style>