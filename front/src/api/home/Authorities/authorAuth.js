import request from "@/utils/axios"
const api_name = '/author'
export default {
    //修改笔名
    modifyAuthorName(data){
        return request({
            url: api_name + '/update',
            method: 'post',
            data: data
        })
    },
    //申请作者
    authorApply(data){
        return request({
            url: api_name + '/beAuthor',
            method: 'post',
            data: data
        })
    }
}