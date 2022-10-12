import Users from '@/views/Pages/Users/UsersView.vue'
import userDetail from '@/views/Pages/Users/userDetailView.vue'
import translatableInput from '@/components/TranslatableInput.vue'

let routes = [
    {
        path: '/users',
        name: 'Users',
        component: Users,
        meta: {
            requiresAuth: true,
            text: 'Users'
        },
    },
    {
        path: '/users/:id',
        name: 'userDetailView',
        component: userDetail,
        meta: {
            requiresAuth: true,
            text: "Users"
        }
    },
  /*   {
        path: '/input',
        name: 'translatableInput',
        component: translatableInput,
        meta: {
            requiresAuth: true,
        }
    }, */
];

export default routes;
