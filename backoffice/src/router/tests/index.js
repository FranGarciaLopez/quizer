import TestsView from '@/views/Pages/Tests/TestsView.vue'
import testsDetailView from '@/views/Pages/Tests/testsDetailView.vue'

let routes = [
    {
        path: '/paths/:id/tests',
        name: 'testsView',
        component: TestsView,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/paths/:path_id/tests/:test_id',
        name: 'testsDetailView',
        component: testsDetailView,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;