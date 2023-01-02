import userQuestionsView from '@/views/Pages/Questions/userQuestionsView.vue'

let routes = [
    {
        path: '/user/:user_id/paths/:path_id/test/:test_id',
        name: 'userQuestionsView',
        component: userQuestionsView,
        meta: {
            requiresAuth: true,
        }
    },
    
];

export default routes;
