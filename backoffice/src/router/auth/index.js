import Login from '@/views/Pages/Auth/LoginView.vue'
import Register from '@/views/Pages/Auth/RegisterView.vue'
import Secure from '@/views/Pages/Auth/SecureView.vue'

let routes = [
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
];

export default routes;
