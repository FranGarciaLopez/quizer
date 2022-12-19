import userPaths from '@/views/Pages/Paths/userPathsView.vue'

let routes = [
    {
        path: '/user/:user_id/paths',
        name: 'userPathsView',
        component: userPaths,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;
