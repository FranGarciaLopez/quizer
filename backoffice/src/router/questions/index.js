import Questions from '@/views/Pages/Questions/QuestionsView.vue'
import addQuestion from '@/views/Pages/Questions/addQuestionView.vue'

let routes = [
    {
        path: '/questions',
        name: 'questionsView',
        component: Questions,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/addQuestion',
        name: 'addQuestion',
        component: addQuestion,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;
