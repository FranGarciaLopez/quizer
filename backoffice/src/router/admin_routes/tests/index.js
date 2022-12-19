import adminTestsView from '@/views/Pages/Tests/adminTestsView.vue'
import adminTestsDetailView from '@/views/Pages/Tests/adminTestsDetailView.vue'

let routes = [
    {
        path: '/admin/paths/:path_id/tests',
        name: 'adminTestsView',
        component: adminTestsView,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/admin/paths/:path_id/tests/:test_id',
        name: 'adminTestsDetailView',
        component: adminTestsDetailView,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;