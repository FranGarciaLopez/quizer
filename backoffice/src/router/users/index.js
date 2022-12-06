import Users from '@/views/Pages/Users/UsersView.vue'
import userDetail from '@/views/Pages/Users/userDetailView.vue'

let routes = [
    {
        path: '/users',
        name: 'Users',
        component: Users,
        meta: {
            requiresAuth: true,
            text: 'Users'
        },
    },
    {
        path: '/users/:user_id',
        name: 'userDetailView',
        component: userDetail,
        meta: {
            requiresAuth: true,
            text: "Users"
        }
    },
];

export default routes;
