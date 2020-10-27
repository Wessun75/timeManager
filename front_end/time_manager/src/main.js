import Vue from 'vue'
import App from './App.vue'
import Router from './libs/router/index'
import Store from './libs/stores/store'

Vue.config.productionTip = false

new Vue({
  router: Router,
  Store,
  render: h => h(App)
}).$mount('#app')
