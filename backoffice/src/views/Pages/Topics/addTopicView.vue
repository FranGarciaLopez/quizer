<template>
    <div class="content">
        <h1>New topic</h1>
        <form @submit.prevent="addTopic">
            <div>
                <input required v-model="name" id="name" type="text" placeholder="Topic"/>
            </div>
            <button type="submit" class="btn btn-primary btn-lg btn-block">Add Topic</button>
        </form>
    </div>
</template>

<script>
import axios from "axios";
export default {
    name:"addTopicView", 
    data: () => ({
        name: '',
        error: false
    }),   
    methods: {
        addTopic () {
            var newTopic = {
                name: this.name,
            };
            axios.post('http://localhost:3000/topics', newTopic)
            .then(()=>{
                this.$router.push("/topics")
            })
        },
    }
}
</script>

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