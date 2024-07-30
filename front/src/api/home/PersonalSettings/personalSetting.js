import request from "@/utils/axios"
const api_name = '/user'
export default {
    //修改个人信息
    updateSelfInfo(info){
        return request({
            url: api_name + '/userUpdate',
            method: 'post',
            data: info
        })
    },
    //获取自身信息
    getSelfInfo(id){
        return request({
            url: api_name + '/' + id,
            method: 'get'
        })
    }
}