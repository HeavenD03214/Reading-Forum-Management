import request from "@/utils/axios"
const api_name = '/book'
export default {
    //书籍列表获取
    getBooks(data){
        return request({
            url: api_name + '/search',
            method: 'get',
            params: data
        })
    },
    //发布书籍
    releaseBook(data){
        return request({
            url: api_name + '/add',
            method: 'post',
            data: data
        })
    },
    //修改书籍
    modifyBook(data){
        return request({
            url: api_name + '/update',
            method: 'post',
            data: data
        })
    },
    //删除书籍
    deleteBook(id){
        return request({
            url: api_name + '/delete/' + id,
            method: 'delete'
        })
    },
}