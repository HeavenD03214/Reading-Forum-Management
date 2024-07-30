package com.nt.nothing.service;

import com.nt.nothing.pojo.ChatMsg;
import com.nt.nothing.pojo.FriendList;
import com.nt.nothing.pojo.FriendRequest;
import com.nt.nothing.pojo.searchChatMsg;

import java.util.List;

public interface ChatService {

    List<Integer> FriendRequestSearch(Integer id);

    List<FriendRequest> FriendRequestSearchByIds(List<Integer> ids);

    void deleteFriendRequest(Integer send,Integer receive);

    void friendAccept(Integer send, Integer receive);

    void friendMake(Integer send, Integer receive);

    void addMsg(ChatMsg chatMsg);

    void deleteMsg(Integer msg);

    void deleteFriend(Integer send, Integer receive);

    List<searchChatMsg> getMsgByFriend(Integer send, Integer receive);

    void updateMsgState(Integer send, Integer receive);

    List<FriendList> friendListGet(Integer id);

    FriendList friendSingleGet(Integer send, Integer receive);


    List<searchChatMsg> getMsgPublic();

    searchChatMsg getMsgPublicLast();

    searchChatMsg getMsgByFriendLast(Integer send, Integer receive);

    void updateMsgStateLast(Integer id);

    Short isFriend(Integer send, Integer receive);
}
