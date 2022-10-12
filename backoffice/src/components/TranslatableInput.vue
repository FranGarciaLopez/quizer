<template>
    <div>
        <form>
            <div v-for="(row, index) in this.text" :key="index" class="input-group mb-3">
                <div class="input-group-prepend">
                    <select id="lang" class="input-group-text" @change="onSelectChange($event)">
                        <option :value="index">
                            {{ index }}
                        </option>
                        <option v-for="key in this.showAllLangs(index)" :key="key" :value=" key ">
                            {{ key }}
                        </option>
                    </select>
                </div>
                <input type="text" class="form-control" v-model="this.text[index]"/>
                <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">
                        <button @click="deleteLanguage(index)" class="btn btn-danger">
                            <i class="bi bi-trash"></i>
                        </button>
                    </span>
                </div>
            </div>
        </form>
        <div v-if="this.showAddLanguages" class="buttons"> 
            <a @click="addLanguage()" class="btn btn-block btn-primary">Add language</a>
        </div>
        
    </div>
</template>


<script>
export default {
    name: 'translatableInput',
    data() {
        return {
            showAddLanguages: true,
            validLangs: ['es','en','de','fr', 'ru'],
        }
    },
    props: {
        text: {
            type: Object
        }
    },
    methods: {
        getValue() {
            return this.text;
        },
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
        showAllLangs(lang) {
            var values = Object.values(this.validLangs.filter(e => !lang.includes(e)));
            return values
        },
        onSelectChange(event) {
            debugger
            console.log(event.target.value)
        },
        buildText(){

        }
    },
    
}
</script>
