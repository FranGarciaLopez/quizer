import Questions from '@/views/Pages/Questions/QuestionsView.vue'
import questionsDetailView from '@/views/Pages/Questions/questionsDetailView.vue'

let routes = [
    {
        path: '/paths/:path_id/tests/:test_id/questions',
        name: 'questionsView',
        component: Questions,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/paths/:path_id/tests/:test_id/questions/:question_id',
        name: 'questionsDetailView',
        component: questionsDetailView,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;
