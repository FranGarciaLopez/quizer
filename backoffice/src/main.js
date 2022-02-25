
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store/store.js'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

import Axios from 'axios'
import VueAxios from 'vue-axios'

Vue.config.productionTip = false
Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
Vue.use(VueAxios, Axios)

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
