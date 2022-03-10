import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/HomeView.vue'
import Login from '../components/LoginView.vue'
import Register from '../components/RegisterView.vue'
import Secure from '../components/SecureView.vue'


const routes = [
  {
    path: '/',
    name: 'homeView',
    component: Home,
    meta: {requiresAuth: true}
    
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
    
  },
  {
    path: '/secure',
    name: 'secure',
    component: Secure,
    

  },
 
]


const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

router.beforeEach((to, from, next)=>{
  const loggedIn = localStorage.getItem('user')
  if(to.matched.some(record => record.meta.requiresAuth) && !loggedIn)  {
    next('/secure')
  }
  next()

})

export default router
