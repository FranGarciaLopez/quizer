import Resources from '@/views/Pages/Resources/ResourcesView.vue'

let routes = [
    {
        path: '/resources',
        name: 'resourcesView',
        component: Resources,
        meta: {
            requiresAuth: true,
        }
    },
];

export default routes;
