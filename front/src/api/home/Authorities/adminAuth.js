import request from "@/utils/axios"
const api_name = ''
export default {
    //用户统查
    getAllUsers(data){
        return request({
            url: api_name + '/admin/searchAll',
            method: 'get',
            params: {
                page: data.page,
                pageSize: data.pageSize,
                username: data.username,
                name: data.name,
                gender: data.gender,
                province: data.province,
                area: data.area
            }
        })
    },
    //查询管理员
    getAdmins(data){
        return request({
            url: api_name + '/admin/search',
            method: 'get',
            params: {
                page: data.page,
                pageSize: data.pageSize,
                username: data.username,
                name: data.name,
                gender: data.gender,
                province: data.province,
                area: data.area
            }
        })
    },
    //修改积分
    modifyBalance(data){
        return request({
            url: api_name + '/money/update',
            method: 'post',
            data: data
        })
    },
    //添加管理员
    addAdmin(id){
        return request({
            url: api_name + '/admin/add/' + id,
            method: 'post'
        })
    },
    //撤销管理员
    deleteAdmin(id){
        return request({
            url: api_name + '/admin/delete/' + id,
            method: 'delete'
        })
    },
    //添加作者
    addAuthor(id){
        return request({
            url: api_name + '/author/add/' + id,
            method: 'post'
        })
    },
    //撤销作者
    deleteAuthor(id){
        return request({
            url: api_name + '/author/delete/' + id,
            method: 'delete'
        })
    },
    //批量删除用户
    deleteUsers(ids){
        return request({
            url: api_name + '/user/delete/' + ids,
            method: 'delete'
        })
    }
}