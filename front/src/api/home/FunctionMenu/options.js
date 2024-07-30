import request from "@/utils/axios"
const api_name = ''
export default {
    //书籍分类列表获取
    getClassifications() {
        return request({
            url: api_name + '/class/searchAll',
            method: 'get'
        })
    },
    //发行商列表获取
    getPublishers() {
        return request({
            url: api_name + '/book/searchAllP',
            method: 'get'
        })
    },
}