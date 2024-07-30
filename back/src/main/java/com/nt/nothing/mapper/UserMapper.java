package com.nt.nothing.mapper;

import com.nt.nothing.pojo.*;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface UserMapper {
    User searchByNameAndPassWord(User user);

    void addUser(User user);

    Admin searchAdmin(Integer id);

    Author searchAuthor(Integer id);

    void userUpdate(User user);


    Integer searchIdByUserName(String username);

    int isExistByUserName(String username);

    int isExistById(Integer id);

    void deleteById(Integer id);

    int isAuthor(Integer id);

    Integer getIdByAuthorName(String author);

    Integer getclassificationByName(String classification);

    Integer getpublisherByName(String publisher);

    void deleteAuthorById(List<Integer> ids);

    List<searchUser> list(String name, Short gender, String province, String area);

    void authorUpdate(Author author);

    void cancelAuthorById(Integer id);

    void addAuthor(Integer id, String name);

    void addAdmin(Integer id);

    void deleteAdminById(Integer id);

    void deleteByIds(List<Integer> ids);

    Double getBalance(Integer id);

    searchAll searchById(Integer id);

    LocalDate getSignDateById(Integer id);

    void updateSignIn(Integer id, LocalDate now);

    List<Integer> getAllId();

    void deleteAdminByIds(List<Integer> ids);

    String getByNameById(Integer id);

    String getUserNameById(Integer id);

    void addSignIn(Integer id, LocalDate time);

    Integer getAuthorIdByAuthorName(String author);
}
