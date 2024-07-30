import request from "@/utils/axios"
const api_name = ''
export default {
    //用户登录
    login(userInfo){
        return request({
            url: api_name + '/login',
            method: 'post',
            data: userInfo
        })
    },
    //用户注册
    register(userInfo){
        return request({
            url: api_name + '/register',
            method: 'post',
            data: userInfo
        })
    },
    //邮箱发送
    sendEmail(email){
        return request({
            url: api_name + '/sendmail',
            method: 'get',
            params: {
                'email': email
            }
        })
    },
    //邮箱验证码验证
    checkEmail(data){
        return request({
            url: api_name + '/checkmail',
            method: 'get',
            params: data
        })
    },
    //修改密码
    modifyPassWord(userInfo){
        return request({
            url: api_name + '/modify',
            method: 'post',
            params: userInfo
        })
    }
}