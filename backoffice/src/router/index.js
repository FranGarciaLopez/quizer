import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/HomeView.vue'
import Login from '../views/Pages/LoginView.vue'
import Register from '../views/Pages/RegisterView.vue'
import Secure from '../views/Pages/SecureView.vue'
import Users from '../views/UsersView.vue'
import Resources from '../views/ResourcesView.vue'
import Topics from '../views/TopicsView.vue'
import Questions from '../views/QuestionsView.vue'
import Paths from '../views/PathsView.vue'
import addUser from '@/views/Pages/addUserView.vue'

const routes = [
  {
    path: '/',
    name: 'homeView',
    component: Home,
    meta: {
      requiresAuth: true,
      
    }
    
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
  {
    path: '/users',
    name: 'users',
    component: Users,
    meta: {
      requiresAuth: true,
      
    }
  },
  {
    path: '/addUser',
    name: 'addUserView',
    component: addUser,
    meta: {
      requiresAuth: true,
      
    }
  },
  {
    path: '/paths',
    name: 'pathsView',
    component: Paths,
    meta: {
      requiresAuth: true,
      
    }
  },
  {
    path: '/questions',
    name: 'questionsView',
    component: Questions,
    meta: {
      requiresAuth: true,
      
    }
  },
  {
    path: '/topics',
    name: 'topicsView',
    component: Topics,
    meta: {
      requiresAuth: true,
      
    }
  },
  {
    path: '/resources',
    name: 'resourcesView',
    component: Resources,
    meta: {
      requiresAuth: true,
      
    }
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
  }else{
    next()
  }


})

export default router
