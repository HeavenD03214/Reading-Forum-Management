import request from "@/utils/axios"
const api_name = '/alipay'
export default {
    //积分充值
    pay(data){
        return request({
            url: api_name + '/pay',
            method: 'get',
            params: data
        })
    }
}