import axios from 'axios'
import {url} from './url'
import router from "@/router";

const whiteList = ['/login','/register','/sendmail','/checkmail']

//创建一个axios示例
const service = axios.create({
    baseURL: 'http://' + url,
    timeout: 5000
})

//请求拦截器 在请求头中加token
service.interceptors.request.use(
    config => { // 将获取到的token设置给header中的token
        if (whiteList.includes(config.url)) {return config;}
        else{
            if (localStorage.getItem('token')) {config.headers.token = localStorage.getItem('token');}
            return config;
        }

    },
    error => {
        return Promise.reject(error);
    }
)

//响应拦截器，响应token过期事件
service.interceptors.response.use(
    response => {
        if (whiteList.includes(response.config.url)) {
            // 如果在白名单中，则不拦截
            return response;
        }

        if(!localStorage.getItem('token')) return;
        if(response.data.code === 0 && response.data.data === 'NOT_LOGIN'){
            setTimeout(()=>{
                router.push({path:'/login'})
            },1000);
            alert('登录状态已过期，请重新登陆！')
            localStorage.removeItem('token');
            return;
        }
        return response;
    },
    error => {
        return Promise.reject(error);
    }
)

export default service