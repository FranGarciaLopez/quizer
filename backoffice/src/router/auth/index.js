import Login from '@/views/Pages/Auth/LoginView.vue'
import Register from '@/views/Pages/Auth/RegisterView.vue'
import PageNotFound from '@/components/PageNotFound.vue'

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
        path: '/:pathMatch(.*)*',
        name: 'notFound',
        component: PageNotFound,
    },
];

export default routes;
