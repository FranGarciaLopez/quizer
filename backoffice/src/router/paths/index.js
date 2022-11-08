import Paths from '@/views/Pages/Paths/PathsView.vue'
import pathDetailView from '@/views/Pages/Paths/pathDetailView.vue'


let routes = [
    {
        path: '/paths',
        name: 'pathsView',
        component: Paths,
        meta: {
            requiresAuth: true,
        }
    },
    {
        path: '/paths/:path_id',
        name: 'pathDetailView',
        component: pathDetailView,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;
