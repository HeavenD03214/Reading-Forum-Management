package com.nt.nothing.mapper;


import com.nt.nothing.pojo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {
    List<Integer> FriendRequestSearch(Integer id);

    List<FriendRequest> FriendRequestSearchByIds(List<Integer> ids);

    void deleteFriendRequest(Integer send, Integer receive);

    void updateFriendState(FriendMsg friendMsg);

    void addFriendRequest(FriendMsg friendMsg);

    void addMsg(ChatMsg chatMsg);

    void deleteMsgById(Integer msg);

    void deleteMsgByFriend(Integer send, Integer receive);

    List<searchChatMsg> getMsgByFriend(Integer send, Integer receive);

    void updateMsgState(Integer send, Integer receive);


    List<Integer> friendSearch(Integer id);

    FriendList publicFriendGet();

    List<searchChatMsg> publicMsgGetAll();

    FriendList friendSingleGet(Integer send, Integer receive);

    searchChatMsg getMsgByFriendLast(Integer send, Integer receive);

    searchChatMsg publicMsgGetLast();

    FriendMsg searchFriendRequestOne(Integer send, Integer receive);

    Integer getUnRead(Integer send, Integer receive);

    FriendList friendPublicGet();

    void updateMsgLastState(Integer id);
}
