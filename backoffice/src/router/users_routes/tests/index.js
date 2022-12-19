import userTestsView from '@/views/Pages/Tests/userTestsView.vue'

let routes = [
    {
        path: '/user/:user_id/paths/:path_id',
        name: 'userTestsView',
        component: userTestsView,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;