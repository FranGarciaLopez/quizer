<template>
    <div>
        <form>
            <div>
                <input type="text" class="form-control" v-model="this.result.right" placeholder="Key"/>
                <input type="number" class="form-control" v-model="this.result.total" placeholder="value"/>
                
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
            this.result= {
                right:"", 
                total:"",
            }
        }
    },
    
}
</script>
