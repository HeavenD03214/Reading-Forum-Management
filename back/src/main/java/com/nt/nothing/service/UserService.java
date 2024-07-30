package com.nt.nothing.service;


import com.nt.nothing.pojo.*;

import java.util.List;

public interface UserService {
    User Login(User user);

    void register(User user);

    Boolean isAdmin(Integer id);

    Boolean isAuthor(Integer id);

    void userUpdate(User user);

    Integer searchIdByUserName(String username);

    boolean isExist(String username);

    boolean idExist(Integer id);

    void deleteById(Integer id);

    PageBean<searchUser> page(Integer page, Integer pageSize, String name, Short gender, String province, String area);


    PageBean<searchAuthor> pageA(Integer page, Integer pageSize, String authorName, String username, String name, Short gender, String province, String area);

    void authorUpdate(Author author);

    void addAuthor(Integer id, String name);

    void addAdmin(Integer id);

    void deleteAdmin(List<Integer> ids);

    PageBean<searchAdmin> pageAd(Integer page, Integer pageSize, String username, String name, Short gender, String province, String area);

    PageBean<searchAll> pageAll(Integer page, Integer pageSize, String username, String name, Short gender, String province, String area);

    void deleteUserById(List<Integer> ids);

    Double getBalance(Integer id);

    searchAll getById(Integer id);

    void addAuthorByid(Integer id);

    boolean signIn(Integer id);

    String getByNameById(Integer id);

    String getByUserNameById(Integer send);
}
