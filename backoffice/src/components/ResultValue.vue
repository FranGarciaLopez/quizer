<template>
    <div>
        <form>
            <div v-for="(value, key) in this.result" :key="key" class="input-group">
                <input type="text"   class="form-control input-group-prepend" :value="key"     @change="onSelectChange($event, key)"   placeholder="Key"/>
                <input type="number" class="form-control input-group-apend"   v-model="this.result[key]" @change="onSelectChange($event, value)" placeholder="value"/>
            </div>
        
            <div class="buttons"> 
                <!--<a @click="addResult()" class="btn btn-block btn-primary text-white">Add result</a>-->
            </div>
            
        </form>
    </div>
</template>


<script>
import { ref } from 'vue';
export default {
    name: 'resultValue',
    props: {
        result: {
            right: "",
            total: "", 
        }
    },
    methods: {
        getValue() {
            return this.result;
        },
        addResult() {
            
        },
        onSelectChange(event, oldKey){
            const newKey = event.target.value;
            Object.keys(this.result).forEach((key) => {
                const tempKey = (oldKey !== key) ? key : newKey;
                const value = this.result[key];
                this.result[tempKey] = this.result[oldKey];
                delete this.result[key];
                this.result[tempKey] = value;
            });
        },
    },
}
</script>
