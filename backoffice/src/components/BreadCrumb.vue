<template>
    <nav aria-label="breadcrumb" class="p-2 navbar navbar-light" style="background-color:#E5E8E8;">
        <ol class="breadcrumb">
            <li v-for="crumb in this.getCrumbs()" :key="crumb"  class="breadcrumb-item align-items-center">
                <router-link style="text-decoration: none;" :to="crumb.link">{{crumb.text}}</router-link>
            </li>
        </ol>
        <button @click="logout" class="btn"><i class="bi bi-box-arrow-left"> Logout</i></button>
    </nav>
</template>

<script>
export default {
    data() {
        return{
            crumbs: this.getCrumbs(),
        }
    },
    methods: {
        getCrumbs() {
            const crumbs = []
            const pathSplit = this.$route.path.split('/');
            const reversePath = [pathSplit.shift()];
            for(var i=0; i< pathSplit.length; i++){
                const text = this.capitalizeString(pathSplit[i])
                reversePath.push(pathSplit[i]);
                const link = reversePath.join('/');
                crumbs.push({text, link});
            }
            return crumbs;
        },
        capitalizeString(str) {
            return str.charAt(0).toUpperCase() + str.slice(1);
        },
        logout() {
            this.$store.dispatch('logout')
        }
    }
};
</script>
 