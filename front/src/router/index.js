import Vue from 'vue';
import VueRouter from 'vue-router';

Vue.use(VueRouter)

export default new VueRouter({
    routes: [
        {
            name: '首页',
            path: '/home',
            component: () => import('@/views/home/homePage')
        },
        {
            name: '登录',
            path: '/login',
            component: () => import('@/views/login/loginMain')
        },
        {
            path: '/:pathMatch(.*)',
            redirect: '/home'
        }
    ]
})
