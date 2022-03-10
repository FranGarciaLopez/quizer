<template>
    <div>
        <h1>This page is protected by auth</h1>
        <div v-if="!loggedIn">
            You can make an account
            <router-link to="/register">
                Register
            </router-link>
            or Login
            <router-link to="/login">
                Login
            </router-link>
        </div>
    </div>
</template>

<script>
import {authComputed} from '../store/helpers.js'
export default {
  name: 'secureView',
  computed:{
    ...authComputed
  },
  
}
</script>;