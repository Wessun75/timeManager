import Vue from 'vue'
import App from './App.vue'
import Router from './libs/router/index'
import Store from '@/store'
import { library, config } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { fas } from '@fortawesome/free-solid-svg-icons'

Vue.config.productionTip = false

config.autoAddCss = false
library.add(fas)
Vue.component('font-awesome-icon', FontAwesomeIcon);

new Vue({
  router: Router,
  Store,
  render: h => h(App)
}).$mount('#app')
