<template>
    <div>
        <form>
            <div v-for="(answer, index) in this.answers" :key="index" class="input-group mb-3">
                <!-- :placeholder="answer.result" -->
                <translatable-input class="form-control" :text="answer.text" labelText="Answers"/>
                <result-value class="form-control" :result="answer.result"/>
                
                <a @click="deleteAnswerInput(index)" class="btn btn-danger text-white">Delete answer</a>
            </div>
        </form>
        <div class="buttons btn-group"> 
            <a @click="addAnswerInput()" class="btn btn-primary text-white">Add answer</a>
        </div>
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
