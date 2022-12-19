import adminUsers from '@/views/Pages/Users/adminUsersView.vue'
import adminUserDetail from '@/views/Pages/Users/adminUserDetailView.vue'

let routes = [
    {
        path: '/admin/users',
        name: 'adminUsers',
        component: adminUsers,
        meta: {
            requiresAuth: true,
            text: 'Users'
        },
    },
    {
        path: '/admin/users/:user_id',
        name: 'adminUserDetailView',
        component: adminUserDetail,
        meta: {
            requiresAuth: true,
            text: "Users"
        }
    },
];

export default routes;
