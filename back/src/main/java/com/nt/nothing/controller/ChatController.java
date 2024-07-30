package com.nt.nothing.controller;

import com.alibaba.fastjson.JSONObject;
import com.nt.nothing.WebSocket.WebSocketUtil;
import com.nt.nothing.anno.Log;
import com.nt.nothing.pojo.*;
import com.nt.nothing.service.ChatService;
import com.nt.nothing.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/9 5:22
 */

@Slf4j
@RestController
@Tag(name = "聊天管理")
@CrossOrigin(origins = "*")
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @Autowired
    private UserService userService;


    //好友请求

    //发送请求
    @Log
    @Operation(summary = "好友申请接口")
    @PostMapping("/beFriend")
    public Result<String> friendMake(@RequestParam Integer send,@RequestParam String username) throws Exception {
        Integer receive = userService.searchIdByUserName(username);
        if(receive == null) return new Result<String>().error("该用户不存在");
        if(receive.equals(send)) return new Result<String>().error("你在干什么");
        if(chatService.isFriend(send,receive) == null) {
            chatService.friendMake(send,receive);
            //如果被请求方在线
            if(WebSocketUtil.isLogin(receive)){
                //通知更新好友请求列表
                Map msgMap = new HashMap();
                msgMap.put("type", "friendRequest");
                WebSocketUtil.sendInfo(JSONObject.toJSONString(msgMap),receive);
            }
        }
        else if(chatService.isFriend(send,receive) == 1) return new Result<String>().error("该用户已是您的好友");
        else if(chatService.isFriend(send,receive) == 0) return new Result<String>().error("您已发送好友申请请求");
        return new Result<String>().success("好友请求发送成功");
    }

    //接受请求
    @Log
    @Operation(summary = "好友申请接受接口")
    @PostMapping("/accept")
    public Result<String> friendAccept(@RequestParam Integer send,@RequestParam Integer receive) throws Exception {
        chatService.friendAccept(receive,send);
        //如果请求方在线
        if(WebSocketUtil.isLogin(receive)){
            //通知更新好友列表
            Map msgMap = new HashMap();
            msgMap.put("type", "updateFriendList");
            WebSocketUtil.sendInfo(JSONObject.toJSONString(msgMap),receive);
        }
        return new Result<String>().success("接受好友成功");
    }

    //拒绝请求
    @Log
    @Operation(summary = "好友申请拒绝接口")
    @DeleteMapping("/reject")
    public Result<String> friendReject(@RequestParam Integer send,@RequestParam Integer receive){
        chatService.deleteFriendRequest(receive,send);
        return new Result<String>().success("拒绝成功");
    }

    //更新请求列表
    @Log
    @Operation(summary = "好友申请列表更新接口")
    @GetMapping("/friendRequest")
    public Result<List<FriendRequest>> friendRequest(@RequestParam Integer id){
        List<Integer> ids = chatService.FriendRequestSearch(id);
        if(ids.isEmpty()){
            return null;
        }
        List<FriendRequest> friendRequestList = chatService.FriendRequestSearchByIds(ids);
        return new Result<List<FriendRequest>>().success(friendRequestList);
    }

    //删除好友
    @Log
    @Operation(summary = "删除好友接口")
    @DeleteMapping("/deleteFriend")
    public Result<String> friendDelete(@RequestParam Integer send,@RequestParam Integer receive) throws Exception {
        chatService.deleteFriend(send,receive);
        if(WebSocketUtil.isLogin(receive)){
            //通知更新好友列表
            Map msgMap = new HashMap();
            msgMap.put("type", "deleteFriend");
            msgMap.put("id", send);
            WebSocketUtil.sendInfo(JSONObject.toJSONString(msgMap),receive);
        }
        return new Result<String>().success("删除成功");
    }

    //消息处理

    //发送消息
    @Log
    @Operation(summary = "消息发送接口")
    @PostMapping("/sendMsg")
    public Result<String> sendMsg(@RequestBody ChatMsg chatMsg) throws Exception {
        //获取时间
        chatMsg.setTime(LocalDateTime.now());
        //设置未读状态
        chatMsg.setState(0);
        chatService.addMsg(chatMsg);
        log.info("{}",chatMsg.getTime());
        if(chatMsg.getReceive() == 0){
            Map msgMap = new HashMap();
            msgMap.put("type", "publicMsg");
            msgMap.put("name", userService.getByNameById(chatMsg.getSend()));
            msgMap.put("username", userService.getByUserNameById(chatMsg.getSend()));
            msgMap.put("msg", chatMsg.getMsg());
            msgMap.put("time", chatMsg.getTime());
            WebSocketUtil.sendInfoAll(JSONObject.toJSONString(msgMap));
        }
        else {
            if(WebSocketUtil.isLogin(chatMsg.getReceive())){
                Map msgMap = new HashMap();
                msgMap.put("type", "sendMsg");
                msgMap.put("name", userService.getByNameById(chatMsg.getSend()));
                msgMap.put("id", chatMsg.getSend());
                msgMap.put("msg", chatMsg.getMsg());
                msgMap.put("time", chatMsg.getTime());
                WebSocketUtil.sendInfo(JSONObject.toJSONString(msgMap),chatMsg.getReceive());
            }
        }
        return new Result<String>().success("消息发送成功");
    }


    //删除消息
    @Operation(summary = "消息删除接口")
    @DeleteMapping("/deleteMsg")
    public Result<String> msgDelete(@RequestParam Integer msg){
        chatService.deleteMsg(msg);
        return new Result<String>().success("删除成功");
    }

    //获取好友列表
    @Operation(summary = "获取好友列表接口")
    @GetMapping("/getFriend")
    public Result<List<FriendList>> friendListGet(@RequestParam Integer id){
        //更新聊天室消息
        List<FriendList> friendList = chatService.friendListGet(id);
        return new Result<List<FriendList>>().success(friendList);
    }

    //更新好友状态
    @Operation(summary = "更新单个好友状态接口")
    @GetMapping("/getFriendSingle")
    public Result<FriendList> friendSingleGet(@RequestParam Integer send, @RequestParam Integer receive){
        FriendList friendList = chatService.friendSingleGet(send,receive);
        return new Result<FriendList>().success(friendList);
    }

    //获取指定窗口消息列表
    @Operation(summary = "获取指定窗口消息列表接口")
    @GetMapping("/getMsg")
    public Result<List<searchChatMsg>> msgGet(@RequestParam Integer send,@RequestParam Integer receive){

        List<searchChatMsg> chatMsgList;

        if(receive == 0){
            chatMsgList =  chatService.getMsgPublic();
        }

        else {
            //获取两者间的所有消息
            chatMsgList = chatService.getMsgByFriend(send,receive);
            //更新未读消息为已读
            chatService.updateMsgState(receive,send);
        }

        return new Result<List<searchChatMsg>>().success(chatMsgList);
    }




    //获取指定窗口最新消息
    @Operation(summary = "获取指定窗口最新消息接口")
    @GetMapping("/getMsgLast")
    public Result<searchChatMsg> msgLastGet(@RequestParam Integer send,@RequestParam Integer receive){

        searchChatMsg chatMsg;

        if(receive == 0){
            chatMsg =  chatService.getMsgPublicLast();
        }

        else {
            //获取两者间的最新消息
            chatMsg = chatService.getMsgByFriendLast(receive,send);
            //更新未读消息为已读
            chatService.updateMsgState(receive,send);
        }

        return new Result<searchChatMsg>().success(chatMsg);
    }
    //公共聊天




}
