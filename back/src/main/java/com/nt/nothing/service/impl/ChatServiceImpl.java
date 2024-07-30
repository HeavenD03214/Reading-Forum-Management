package com.nt.nothing.service.impl;

import com.nt.nothing.mapper.ChatMapper;
import com.nt.nothing.mapper.UserMapper;
import com.nt.nothing.pojo.*;
import com.nt.nothing.service.ChatService;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/9 5:53
 */
@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatMapper chatMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Integer> FriendRequestSearch(Integer id) {
        return chatMapper.FriendRequestSearch(id);
    }

    @Override
    public List<FriendRequest> FriendRequestSearchByIds(List<Integer> ids) {
        return chatMapper.FriendRequestSearchByIds(ids);
    }

    @Override
    public void deleteFriendRequest(Integer send, Integer receive) {
        chatMapper.deleteFriendRequest(send,receive);
    }

    @Override
    public void friendAccept(Integer send, Integer receive) {
        chatMapper.updateFriendState(new FriendMsg(send,receive,1));
        FriendMsg friendMsg = chatMapper.searchFriendRequestOne(receive,send);
        if(friendMsg != null){
            chatMapper.updateFriendState(new FriendMsg(receive,send,1));
        }
        else {
            chatMapper.addFriendRequest(new FriendMsg(receive,send,1));
        }
    }

    @Override
    public void friendMake(Integer send, Integer receive) {
        chatMapper.addFriendRequest(new FriendMsg(send,receive,0));
    }

    @Override
    public void addMsg(ChatMsg chatMsg) {
        chatMapper.addMsg(chatMsg);
    }

    @Override
    public void deleteMsg(Integer msg) {
        chatMapper.deleteMsgById(msg);
    }

    @Override
    public void deleteFriend(Integer send, Integer receive) {
        chatMapper.deleteFriendRequest(send, receive);
        chatMapper.deleteFriendRequest(receive, send);
        chatMapper.deleteMsgByFriend(send,receive);
        chatMapper.deleteMsgByFriend(receive,send);
    }

    @Override
    public List<searchChatMsg> getMsgByFriend(Integer send, Integer receive) {
        return chatMapper.getMsgByFriend(send,receive);
    }

    @Override
    public void updateMsgState(Integer send, Integer receive) {
        chatMapper.updateMsgState(send,receive);
    }

    @Override
    public List<FriendList> friendListGet(Integer id) {
        List<Integer> ids = chatMapper.friendSearch(id);
        List<FriendList> friendLists = new ArrayList<>();
        for(Integer receive : ids){
            /*Integer unRead = chatMapper.getUnRead(receive,id);
            String name = userMapper.getByNameById(receive);
            String username = userMapper.getUserNameById(receive);
            ChatMsg chatMsg*/
            FriendList friendList = chatMapper.friendSingleGet(receive,id);
            friendList.setUnRead(chatMapper.getUnRead(receive,id));
            friendLists.add(friendList);

        }
        return friendLists;
    }

    @Override
    public FriendList friendSingleGet(Integer send, Integer receive) {
        FriendList friendList = chatMapper.friendSingleGet(receive,send);
        friendList.setUnRead(chatMapper.getUnRead(receive,send));
        return friendList;
    }



    @Override
    public List<searchChatMsg> getMsgPublic() {
        return chatMapper.publicMsgGetAll();
    }

    @Override
    public searchChatMsg getMsgPublicLast() {
        return chatMapper.publicMsgGetLast();
    }

    @Override
    public searchChatMsg getMsgByFriendLast(Integer send, Integer receive) {
        return chatMapper.getMsgByFriendLast(send,receive);
    }

    @Override
    public void updateMsgStateLast(Integer id) {
        chatMapper.updateMsgLastState(id);
    }

    @Override
    public Short isFriend(Integer send, Integer receive) {
         FriendMsg friendRequest = chatMapper.searchFriendRequestOne(send,receive);
         if(friendRequest == null) return null;
         else if(friendRequest.getState() == 0) return 0;
         else if(friendRequest.getState() == 1) return 1;
         return null;
    }


}
