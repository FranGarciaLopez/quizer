import adminQuestions from '@/views/Pages/Questions/adminQuestionsView.vue'
import adminQuestionsDetailView from '@/views/Pages/Questions/adminQuestionsDetailView.vue'


let routes = [
    {
        path: '/admin/paths/:path_id/tests/:test_id/questions',
        name: 'adminQuestionsView',
        component: adminQuestions,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/admin/paths/:path_id/tests/:test_id/questions/:question_id',
        name: 'adminQuestionsDetailView',
        component: adminQuestionsDetailView,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;
