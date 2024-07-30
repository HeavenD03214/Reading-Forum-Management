package com.nt.nothing.mapper;

import com.nt.nothing.pojo.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {
    List<Book> list(String book_name, String classification, String author, String publisher);

    void deleteById(Integer id);

    int isExistByBookName(String bookName);

    void addBook(dBook book);

    void updateBook(dBook book);

    void deleteByIds(List<Integer> ids);

    int cExistByCName(String classification);

    void updateC(Classification classification);

    void addC(String classification);

    void deleteByC(Integer id);

    void deleteC(Integer id);

    List<Classification> listC(String classification);

    List<searchAuthor> listA(String authorName, String username, String name, Short gender, String province, String area);

    List<searchAdmin> listAd(String username, String name, Short gender, String province, String area);

    List<searchAll> listAll(String username, String name, Short gender, String province, String area);

    List<Classification> searchAllC();

    List<Publisher> searchAllP();
}
