<template>
    <div>
        <form>
            <div v-for="(answer, index) in this.answers" :key="index" class="input-group mb-3">
                <div class="input-group-prepend" v-if="answer.result.right === 1">
                    <input type="text" class="form-control input-group-text text-bg-success" v-model="answer.result.right"/>
                </div>
                <div class="input-group-prepend" v-else-if="answer.result.right === 0">
                    <input type="text" class="form-control input-group-text text-bg-danger" v-model="answer.result.right"/>
                </div>
                <input type="text" class="form-control" v-model="answer.text.es">
                <div class="input-group-append">
                    <span class="input-group-text text-bg-danger" id="basic-addon2">
                        <button @click="deleteLanguage(index)" class="btn btn-danger">
                            <i class="bi bi-trash"></i>
                        </button>
                    </span>
                </div>
               
            </div>
        </form>
    </div>
</template>


<script>
import {authComputed} from '@/store/helpers.js';
export default {
    name: 'resultInput',
    props: {
        text: {
            type: Object
        },
        answers: {
            type: Object
        }
    },
    computed:{
        ...authComputed
    },
    methods: {
        /* getValue() {
            return this.text;
        }, */
    },
    
}
        
/*
        getAdditionalLanguages(){
            const langsInUse = Object.keys(this.text);
            return this.validLangs.filter(x => !langsInUse.includes(x));
        },
        hasAdditionalLanguages(){
            return this.getAdditionalLanguages().length > 0;
        },
        addLanguage(){
            const newLang = this.getAdditionalLanguages()[0];
            this.text[newLang] = '';
            this.setShowAddLanguages();
        },
        deleteLanguage(lang) {
            delete this.text[lang];
            this.setShowAddLanguages();
        },
        setShowAddLanguages() {
            this.showAddLanguages = Object.keys(this.text).length < this.validLangs.length
        },
        showAllLangs() {
            const langsInUse = Object.keys(this.text);
            var value = Object.values(this.validLangs.filter(e => !langsInUse.includes(e)));
            return value
        },
        onSelectChange(event, prevLang) {
            const newLang = event.target.value
            this.text[newLang] = this.text[prevLang];
            delete this.text[prevLang];
        }, */

    /* }, */
</script>
