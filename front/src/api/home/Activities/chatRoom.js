import request from "@/utils/axios"
const api_name = '/chat'
export default {
    //聊天历史记录获取
    getChatMes(id,receive = 0){
        return request({
            url: api_name + '/getMsg',
            method: 'get',
            params: {
                send: id,
                receive: receive
            }
        })
    },
    //聊天室最新消息获取
    getChatRoomMesLast(id){
        return request({
            url: api_name + '/getMsgLast',
            method: 'get',
            params: {
                send: id,
                receive: 0
            }
        })
    },
    //消息发送
    sendMes(data){
        return request({
            url: api_name + '/sendMsg',
            method: 'post',
            data: data
        })
    }
}