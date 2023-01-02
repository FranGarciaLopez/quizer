<template>
    <div>
        <form>
            <div v-for="(answer, index) in this.answers" :key="index" class="input-group mb-3">
                <!-- :placeholder="answer.result" -->
                <translatable-input ref="answerTextField"       class="form-control" :text="answer.text" labelText="Answers"/>
                <result-value       ref="answerResultField"     class="form-control" :result="answer.result"/>
                
                <a @click="deleteAnswerInput(index)" class="btn btn-danger text-white">Delete answer</a>
            </div>
        </form>
        <div class="buttons btn-group"> 
            <a @click="addAnswerInput()" class="btn btn-primary text-white">Add answer</a>
        </div>
    </div>
</template>


<script>
import TranslatableInput from '@/components/TranslatableInput.vue';
import ResultValue from '@/components/ResultValue.vue';
import {authComputed} from '@/store/helpers.js';
export default {
    props: {
        answers: {
            type: Object,
        }
    },
    computed:{
        ...authComputed
    },
    methods: {
        getValue() {
            for(let index = 0; index<this.answers.length; index++){
                this.answers[index].result = this.$refs.answerResultField[index].result;
            }
            return this.answers
        },
        addAnswerInput() {
            this.answers.push({
                result: {
                    right: '',
                    total: '',
                },
                text: { es: '' }
            })
        },
        deleteAnswerInput(id) {
            if(id > -1){
                this.answers.splice(id, 1)
            }
        }
    },
    components: {
        TranslatableInput,
        ResultValue
    }
    
}
</script>
