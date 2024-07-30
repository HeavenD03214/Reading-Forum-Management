import request from "@/utils/axios"
const api_name = ''
export default {
    //签到
    lottery(data){
        return request({
            url: api_name + '/card/play',
            method: 'get',
            params: data
        })
    }
}