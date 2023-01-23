<template>
<div class="vh-100">
    <div class="row m-3">
        <div class="col-sm-6 mb-3" v-for="(data, index) in this.text">
            <div class="card card-bordered" >
                <div class="card-grid" :style="{'background-color': this.resultColor(index)}">
                    <div class="ribbon-top-vertical position-absolute bg-info p-3" v-if="data.acc_results && (data.status === 'complete') && (this.$route.name === 'userTestsView')">Completed</div>
                    <div class="card-body">
                        <h2 class="card-title">{{data.name.es}}</h2>
                        <h5 class="card-text">{{data.desc.es}}</h5>
                        <section class="col p-0">
                            <hr>
                            <footer class="footer">
                                <slot name="link-button">
                                        <div  class="float-right">
                                            <router-link :to="this.link+`/${data.id}`" v-if="(this.$route.name === 'userTestsView')">
                                                <button class="btn btn-primary btn-lg mr-2" @click="this.insertUserTest(data.id)">{{this.buttonText}}</button>
                                            </router-link>
                                            <router-link :to="this.link+`/${data.id}`" v-else>
                                                <button class="btn btn-primary btn-lg mr-2">{{this.buttonText}}</button>
                                            </router-link>
                                        </div>
                                        <div class="float-left">
                                            <h6 v-if="data.acc_results && (Object.keys(data.acc_results).length !== 0) && (this.$route.name === 'userTestsView')">
                                                Score: {{data.acc_results.right}}/{{data.acc_results.total}}
                                            </h6>
                                            <h6 v-else-if="this.$route.name === 'userTestsView'">
                                                You have not done the test yet.
                                            </h6>
                                        </div>
                                </slot>
                            </footer>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
import axios from "axios";

export default {
    name: 'cardView',
    data() {
        return {
            ApiUrl: "http://localhost:3000",
        };
    },
    props: {
        text: {
            type: Object,
        },
        buttonText:{
            type: String,
        },
        link: {
            type: String,        
        }
    },
    methods: {
        insertUserTest(testId) {
            var status = "complete";
            axios.post(this.ApiUrl + `/users/${this.$route.params.user_id}/tests/${testId}`, status);
        },
        resultColor(index) {
            let color = "white";
            if (this.text[index].acc_results && (this.text[index].acc_results.right >= 5)) {
                color = "#90ee90"
            }else if(this.text[index].acc_results && (this.text[index].acc_results.right < 5)){
                color = "#ff8785 "
            }
            return color
        }
    }
}
</script>

<style>
.card-grid {
  display: grid;
  grid-template-rows: 50px 1fr;
  grid-template-columns: 100%;
  grid-template-areas: 
    "ribbon"
    "card-body";
}


.ribbon-top-vertical {
  position: absolute;
  width: 180px;
  height: 48px;
  background-color: #0dcaf0;
  transform: rotate(360deg);
}

.ribbon-top-vertical:before {
  content: "";
  position: absolute;
  top: 0;
  right: -25px;
  width: 0;
  height: 0;
  border-top: 25px solid transparent;
  border-bottom: 23px solid transparent;
  border-left: 25px solid #0dcaf0;
}


.card-body {
  grid-area: card-body;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>