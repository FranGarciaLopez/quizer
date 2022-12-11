<template>
    <div>
        <form>
            <div v-for="(value, key) in this.result" :key="key" class="input-group">
                {{key}}:{{value}}
                <input type="text" class="form-control input-group-prepend" :value="key" @change="onSelectChange($event, key)" placeholder="Key"/>
                <input type="number" class="form-control input-group-apend" :value="value" @change="onSelectChange($event, value)" placeholder="value"/>
            </div>
        
            <div class="buttons"> 
                <a @click="addResult()" class="btn btn-block btn-primary text-white">Add result</a>
            </div>
            
        </form>
    </div>
</template>


<script>
export default {
    name: 'resultValue',
    props: {
        result: {
            right:"",
            total:"",
        }
    },
    methods: {
        getValue() {
            return this.result;
        },
        addResult() {
            debugger
            this.result.key = 0;
        },
        onSelectChange(event, oldKey){
            const newKey = event.target.value;
            Object.keys(this.result).forEach((key) => {
                debugger  
            })
        },
    },
}
</script>
