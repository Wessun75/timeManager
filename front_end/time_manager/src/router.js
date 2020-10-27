import Vue from 'vue'
import Router from 'vue-router'
import store from './libs/stores/store.js'
import Home from '../../OLD/views/Home.vue'
import About from '../../OLD/views/About.vue'
import Login from './components/authentication/Login.vue'
import Register from './components/authentication/Register.vue'
import Resource from '../../OLD/resources/Resources.vue'
Vue.use(Router)
let router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    },
    {
      path: '/register',
      name: 'register',
      component: Register
    },
    {
      path: '/resources',
      name: 'resources',
      component: Resource,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/about',
      name: 'about',
      component: About,
    }
  ]
})
router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requiresAuth)) {
      if (store.getters.isLoggedIn) {
        next()
        return
      }
      next('/login')
    } else {
      next()
    }
  })
export default router