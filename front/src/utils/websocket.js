import {EventBus} from './eventBus'
import {url} from './url'

export default class SocketService {
    // 用于实现单例模式的写法
    // 可以确保在整个应用程序中只有一个SocketService实例存在，避免了多次实例化和重复连接服务器的问题。通过单例模式，可以方便地在应用程序的不同模块中共享同一个SocketService实例，实现统一的数据传输和处理逻辑。
    static instance = null;
    static get Instance() {
        if (!this.instance) {
            this.instance = new SocketService()
        }
        return this.instance
    }
    ws = null
    // 标识是否连接成功
    connected = false
    // 重试的次数
    sendRetryCount = 0
    // 重连的次数
    connectRetryCount = 0
    // 存储回调函数
    // callBackMapping = {}
    heartbeatInterval = null;
    // 连接服务器的方法
    connect(vue) {
        // 连接服务器
        if (!window.WebSocket) {
            return console.log("浏览器不支持webSocket")
        }
        if (!localStorage.getItem("token")) {
            console.log('没有token，不连接WebSocket');
            return;
        }
        this.ws = new WebSocket("ws://" + url + "/webSocket/" + localStorage.getItem('id'));
        // 连接成功的事件
        this.ws.onopen = () => {
            console.log("连接成功");
            this.connected = true;
            this.connectRetryCount = 0;
            clearTimeout(this.heartbeatInterval);
            //this.start();
        }
        // 连接失败的事件
        this.ws.onclose = () => {
            console.log("连接失败")
            this.connected = false;

            if (this.connectRetryCount <= 100) {
                this.connectRetryCount++
            }
            setTimeout(() => {
                this.connect(vue)
            }, this.connectRetryCount * 500)
        }

        // 收到数据的事件
        this.ws.onmessage = (res) => {
            try {
                let data = JSON.parse(res.data);

                let type = data.type;
                // 处理不同类型的消息
                switch (type) {
                    case 'publicMsg': EventBus.$emit('chatMesReceive', data); break;
                    case 'sendMsg': EventBus.$emit('friendChatReceive', data); break;
                    case 'friendRequest': EventBus.$emit('updateFriendList', data); break;
                    case 'updateFriendList': EventBus.$emit('updateFriendList', data); break;
                    case 'orderResult': EventBus.$emit('rechargeSuccess', data); break;
                }
            } catch (e) {
                console.log('e', e);
            }
        }
    }
    // 发送
    send(data) {
        if (this.connected) {
            this.sendRetryCount = 0;
            this.ws.send(data)
        } else {
            this.sendRetryCount++
            setTimeout(() => { }, this.sendRetryCount * 500)
        }
    }
    // 关闭socket连接
    close() {
        if (this.ws) {
            this.ws.close();
            this.connected = false; // 更新连接状态
            clearInterval(this.heartbeatInterval); // 清除心跳检测定时器
        }
    }
    // 开启心跳检测
    start() {
        this.heartbeatInterval = setInterval(() => {
            this.data = {
                type: "ping"
            };
            this.send(JSON.stringify(this.data));
        }, 5000);
    }
}