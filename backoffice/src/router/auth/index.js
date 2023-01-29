import Login from '@/views/Pages/Auth/LoginView.vue'
import PageNotFound from '@/components/PageNotFound.vue'

let routes = [
    {
        path: '/login',
        name: 'login',
        component: Login,
    },
    {
        path: '/:pathMatch(.*)*',
        name: 'notFound',
        component: PageNotFound,
    },
];

export default routes;
