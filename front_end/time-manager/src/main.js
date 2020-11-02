import Vue from 'vue'
import axios from 'axios'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify';

//require('@/store/subs')

axios.defaults.baseURL = "http://localhost:4000/api/"

Vue.config.productionTip = false

//to get re-authenticated (when the user refreshes the page)
/*store.dispatch('auth/attempt',localStorage.getItem('token')).then(()=>{
 new Vue({
   router,
   store,
    vuetify,
  render: h => h(App)
  }).$mount('#app')
})
*/
//wait for the api request to the endpoint to finish befor rendering the app
new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
