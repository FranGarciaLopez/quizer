import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/HomeView.vue'
import auth_routes from '@/router/auth'

import admin_users_routes from '@/router/admin_routes/users'
import admin_paths_routes from '@/router/admin_routes/paths'
import admin_tests_routes from '@/router/admin_routes/tests'
import admin_questions_routes from '@/router/admin_routes/questions'
import admin_topics_routes from '@/router/admin_routes/topics'
import admin_resources_routes from '@/router/admin_routes/resources'

import users_paths_routes from '@/router/users_routes/paths'
import users_tests_routes from '@/router/users_routes/tests'
import users_questions_routes from '@/router/users_routes/questions'


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
  ...admin_users_routes,
  ...admin_paths_routes,
  ...admin_tests_routes,
  ...admin_questions_routes,
  ...admin_topics_routes,
  ...admin_resources_routes,

  ...users_paths_routes,
  ...users_tests_routes,
  ...users_questions_routes,
]


const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

router.beforeEach((to, from, next)=>{
  const loggedIn = localStorage.getItem('user')
  if(to.matched.some(record => record.meta.requiresAuth) && !loggedIn)  {
    next('/login')
  }else{
    next()
  }

})

export default router
