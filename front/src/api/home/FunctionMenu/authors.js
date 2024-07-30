import request from "@/utils/axios"
const api_name = '/author'
export default {
    //作者列表获取
    getAuthors(data){
        return request({
            url: api_name + '/search',
            method: 'get',
            params: data
        })
    }
}