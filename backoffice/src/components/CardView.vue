<template>
<div class="vh-100">
    <div class="row m-3">
        <div class="col-sm-6 mb-3" v-for="(data) in this.text">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">{{data.name.es}}</h5>
                    <p class="card-text">{{data.desc.es}}</p>
                    <section class="col p-0">
                        <hr>
                        <footer class="footer">
                            <slot name="link-button">
                                <router-link :to="this.link+`/${data.id}`">
                                    <button class="btn btn-primary btn-lg mr-2">{{this.buttonText}}</button>
                                </router-link>
                            </slot>
                            <slot name="completed-icon">
                                <button class="btn btn-secondary btn-lg mr-2">
                                    <i class="bi bi-check-circle"  v-if="data.satatus == 'active'"></i>
                                    <i class="bi bi-check-circle-fill"  v-else></i>
                                </button>
                            </slot>
                        </footer>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>
</template>

<script>
export default {
    name: 'cardView',
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

}
</script>
