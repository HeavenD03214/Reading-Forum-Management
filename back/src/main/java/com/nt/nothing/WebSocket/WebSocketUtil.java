package com.nt.nothing.WebSocket;

import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;


/**
 * The type Web socket util.
 */
@ServerEndpoint(value = "/webSocket/{uId}")
@Component
@Slf4j
public class WebSocketUtil {
    private Session session;
    private static CopyOnWriteArraySet<WebSocketUtil> webSocketSet = new CopyOnWriteArraySet<>();
    private static ConcurrentHashMap<Integer, WebSocketUtil> webSocketMap = new ConcurrentHashMap<>();
    //与用户id一致
    private Integer uId = null;


    /**
     * On open.
     *
     * @param session the session
     * @param uId     the u id
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("uId") Integer uId) {
        this.session = session;
        this.uId = uId;
        if (webSocketMap.containsKey(uId)) {
            webSocketMap.remove(uId);
            webSocketMap.put(uId, this);
        } else {
            webSocketMap.put(uId, this);
            webSocketSet.add(this);
        }

        log.info("{}",uId);

        log.info("【websocket消息】有新的连接，总数：{}", webSocketMap.size());
    }

    /**
     * On close.
     *
     * @throws Exception the exception
     */
    @OnClose
    public void onClose()  {
        if (webSocketMap.containsKey(uId)) {

            webSocketMap.remove(uId);
            //从set中删除
            webSocketSet.remove(this);
        }
        log.info("【websocket消息】连接断开，总数：{}", webSocketSet.size());
    }

    /**
     * On message.
     *
     * @param message the message
     * @throws Exception the exception
     */
    @OnMessage
    public void onMessage(String message) throws Exception {
        log.info("【websocket消息】收到客户端发来的消息：{}", message);
        //message发送信息，信息类型
    }

    /**
     * Send message.
     *
     * @param message the message
     */
    public void sendMessage(String message) {
        try {
            this.session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 发送自定义消息
     *
     * @param message the message
     * @param uId     the u id
     * @throws Exception the exception
     */
    public static void sendInfo(String message, Integer uId) throws Exception {

        //log.info("发送消息到:"+uId+"，报文:"+message);
        if (webSocketMap.containsKey(uId)) {
            log.info(message);
            webSocketMap.get(uId).sendMessage(message);
        } else {
            log.error("用户" + uId + ",不在线！");
            throw new Exception("连接已关闭，请刷新页面后重试");
        }
    }

    public static void sendInfoAll(String message) throws Exception {
        //log.info("发送消息到:"+uId+"，报文:"+message);
        for(Integer id : webSocketMap.keySet()){
            WebSocketUtil.sendInfo(message,id);
        }
    }

    public static Boolean isLogin(Integer uId){

        //log.info("发送消息到:"+uId+"，报文:"+message);
        if (webSocketMap.containsKey(uId))  return true;
        return false;
    }
}
