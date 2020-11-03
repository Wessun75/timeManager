import Vue from 'vue'
import App from './App.vue'
import Router from './libs/router/index'
import Store from '@/store'
import vuetify from '@/plugins/vuetify'
import Vuetify from 'vuetify/lib'
import Vuelidate from 'vuelidate'

Vue.config.productionTip = false

Vue.use(Vuetify)
Vue.use(Vuelidate)

new Vue({
  router: Router,
  Store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
