package com.nt.nothing.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.nt.nothing.mapper.BookMapper;
import com.nt.nothing.mapper.MoneyMapper;
import com.nt.nothing.mapper.UserMapper;
import com.nt.nothing.pojo.*;
import com.nt.nothing.service.MoneyService;
import com.nt.nothing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/5 14:50
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MoneyMapper moneyMapper;

    @Autowired
    private BookMapper bookMapper;

    @Override
    public User Login(User user) {
        return userMapper.searchByNameAndPassWord(user);
    }

    @Override
    public void register(User user) {
        userMapper.addUser(user);
    }

    @Override
    public Boolean isAdmin(Integer id) {
        if(userMapper.searchAdmin(id) != null){
            return true;
        }
        return false;
    }

    @Override
    public Boolean isAuthor(Integer id) {
        if(userMapper.searchAuthor(id) != null){
            return true;
        }
        return false;
    }

    @Override
    public void userUpdate(User user) {
        userMapper.userUpdate(user);
    }

    @Override
    public Integer searchIdByUserName(String username) {
        return userMapper.searchIdByUserName(username);
    }

    @Override
    public boolean isExist(String username) {
        if(userMapper.isExistByUserName(username) != 0) return true;
        return false;
    }

    @Override
    public boolean idExist(Integer id) {
        if(userMapper.isExistById(id) != 0) return true;
        return false;
    }

    @Override
    public void deleteById(Integer id) {

        //删除钱包
        moneyMapper.deleteByUserId(id);
        //如果是作家删除书籍
        if(userMapper.isAuthor(id) != 0){
            bookMapper.deleteById(id);
        }
        //删除用户表
        userMapper.deleteById(id);
    }

    @Override
    public PageBean<searchUser> page(Integer page, Integer pageSize, String name, Short gender, String province, String area) {
        PageHelper.startPage(page,pageSize);

        //2. 执行查询
        List<searchUser> userList = userMapper.list(name, gender, province, area);
        Page<searchUser> p = (Page<searchUser>) userList;

        //3. 封装PageBean对象
        return new PageBean<>(p.getTotal(), p.getResult());
    }

    @Override
    public PageBean<searchAuthor> pageA(Integer page, Integer pageSize, String authorName, String username, String name, Short gender, String province, String area) {
        PageHelper.startPage(page,pageSize);

        //2. 执行查询
        List<searchAuthor> authorList = bookMapper.listA(authorName,username,name,gender,province,area);
        Page<searchAuthor> p = (Page<searchAuthor>) authorList;

        //3. 封装PageBean对象
        return new PageBean<>(p.getTotal(), p.getResult());
    }

    @Override
    public void authorUpdate(Author author) {
        userMapper.authorUpdate(author);
    }

    @Override
    public void addAuthor(Integer id, String name) {
        userMapper.addAuthor(id,name);
    }

    @Override
    public void addAdmin(Integer id) {
        userMapper.addAdmin(id);
    }

    @Override
    public void deleteAdmin(List<Integer> ids) {
        userMapper.deleteAdminByIds(ids);
    }

    @Override
    public PageBean pageAd(Integer page, Integer pageSize, String username, String name, Short gender, String province, String area) {
        PageHelper.startPage(page,pageSize);

        //2. 执行查询
        List<searchAdmin> adminList = bookMapper.listAd(username,name,gender,province,area);
        Page<searchAdmin> p = (Page<searchAdmin>) adminList;

        //3. 封装PageBean对象
        return new PageBean(p.getTotal(), p.getResult());
    }

    @Override
    public PageBean<searchAll> pageAll(Integer page, Integer pageSize, String username, String name, Short gender, String province, String area) {
        PageHelper.startPage(page,pageSize);

        //2. 执行查询
        List<searchAll> allList = bookMapper.listAll(username,name,gender,province,area);
        Page<searchAll> p = (Page<searchAll>) allList;

        //3. 封装PageBean对象
        return new PageBean<>(p.getTotal(), p.getResult());
    }

    @Override
    public void deleteUserById(List<Integer> ids) {
        userMapper.deleteAuthorById(ids);
        userMapper.deleteAdminByIds(ids);
        userMapper.deleteByIds(ids);
    }

    @Override
    public Double getBalance(Integer id) {
        return userMapper.getBalance(id);
    }

    @Override
    public searchAll getById(Integer id) {
        return userMapper.searchById(id);
    }

    @Override
    public void addAuthorByid(Integer id) {
        userMapper.addAuthor(id,"");
    }

    @Override
    public boolean signIn(Integer id) {
        LocalDate time = userMapper.getSignDateById(id);
        if(time == null){
            userMapper.addSignIn(id,LocalDate.now());
            return true;
        }
        if(LocalDate.now().compareTo(time) != 0){
            userMapper.updateSignIn(id,LocalDate.now());
            return true;
        }
        return false;
    }

    @Override
    public String getByNameById(Integer id) {
        return userMapper.getByNameById(id);
    }

    @Override
    public String getByUserNameById(Integer send) {
        return userMapper.getUserNameById(send);
    }
}
