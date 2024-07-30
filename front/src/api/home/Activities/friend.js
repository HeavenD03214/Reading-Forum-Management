import request from "@/utils/axios"
const api_name = '/chat'
export default {
    //申请好友
    addFriend(data){
        return request({
            url: api_name + '/beFriend',
            method: 'post',
            data: data
        })
    },
    //获取好友列表
    getFriendList(id){
        return request({
            url: api_name + '/getFriend',
            method: 'get',
            params: {
                'id': id
           }
        })
    },
    //获取单个好友状态
    getFriendListSingle(data){
        return request({
            url: api_name + '/getFriendSingle',
            method: 'get',
            params: data
        })
    },
    //获取申请好友列表
    getFriendRequestList(id){
        return request({
            url: api_name + '/friendRequest',
            method: 'get',
            params: {
                'id': id
            }
        })
    },
    //同意好友申请
    friendRequestAgree(data){
        return request({
            url: api_name + '/accept',
            method: 'post',
            data: data
        })
    },
    //拒绝好友申请
    friendRequestDisagree(data){
        return request({
            url: api_name + '/reject',
            method: 'delete',
            params: data
        })
    },
    //消息窗最新消息获取
    getChatMesLast(data){
        return request({
            url: api_name + '/getMsgLast',
            method: 'get',
            params: data
        })
    },
    //删除好友
    deleteFriend(data){
        return request({
            url: api_name + '/deleteFriend',
            method: 'delete',
            params: data
        })
    }
}