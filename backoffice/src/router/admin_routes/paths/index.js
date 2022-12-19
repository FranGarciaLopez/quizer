import adminPaths from '@/views/Pages/Paths/adminPathsView.vue'
import adminPathDetailView from '@/views/Pages/Paths/adminPathDetailView.vue'


let routes = [
    {
        path: '/admin/paths',
        name: 'adminPathsView',
        component: adminPaths,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/admin/paths/:path_id',
        name: 'adminPathDetailView',
        component: adminPathDetailView,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;
