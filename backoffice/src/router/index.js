import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/HomeView.vue'
import auth_routes from '@/router/auth'
import user_routes from '@/router/users'
import question_routes from '@/router/questions'
import topics_routes from '@/router/topics'
import paths_routes from '@/router/paths'
import resources_routes from '@/router/resources'
import tests_routes from '@/router/tests'


const routes = [
  {
    path: '/',
    name: 'homeView',
    component: Home,
    meta: {
      requiresAuth: true,
      
    },
  },
  ...auth_routes,
  ...user_routes,
  ...question_routes,
  ...topics_routes,
  ...paths_routes,
  ...resources_routes,
  ...tests_routes,
 
]


const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

router.beforeEach((to, from, next)=>{
  const loggedIn = localStorage.getItem('user')
  if(to.matched.some(record => record.meta.requiresAuth) && !loggedIn)  {
    next('/secure')
  }else{
    next()
  }

})

export default router
