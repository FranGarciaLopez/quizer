<template>
    <div>
        <form>
            <div v-for="(row, index) in this.text" :key="index" class="input-group mb-3">
                <div class="input-group-prepend mb-1">
                    <select id="lang" class="input-group-text" @change="onSelectChange($event, index)">
                        <option :value="index">
                            {{ index }}
                        </option>
                        <option v-for="key in this.showAllLangs(index)" :key="key" :value=" key ">
                            {{ key }}
                        </option>
                    </select>

                </div>
                <div class="form-floating mb-1 input-group">
                    <input type="text" class="formData form-control" id="formText" v-model="this.text[index]" />
                    <label for="formText">{{this.labelText}}</label>
                </div>

                <div class="input-group-append mb-1">
                    <span class="input-group-text" id="basic-addon2">
                        <button @click="deleteLanguage(index)" class="btn btn-danger">
                            <i class="bi bi-trash"></i>
                        </button>
                    </span>
                </div>
            </div>
            <div v-if="this.showAddLanguages" class="buttons"> 
                <a @click="addLanguage()" class="btn btn-block btn-primary text-white">Add language</a>
            </div>
        </form>
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
        },
        labelText: {
            type: String
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
        showAllLangs() {
            const langsInUse = Object.keys(this.text);
            var value = Object.values(this.validLangs.filter(e => !langsInUse.includes(e)));
            return value
        },
        onSelectChange(event, prevLang) {
            const newLang = event.target.value
            this.text[newLang] = this.text[prevLang];
            delete this.text[prevLang];
        },

    },
    
}
</script>
