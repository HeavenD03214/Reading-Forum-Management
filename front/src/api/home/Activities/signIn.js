import request from "@/utils/axios"
const api_name = '/user'
export default {
    //签到
    signIn(id){
        return request({
            url: api_name + '/signIn/' + id,
            method: 'post'
        })
    }
}