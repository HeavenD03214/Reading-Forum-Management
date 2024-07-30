package com.nt.nothing.service;

import com.nt.nothing.pojo.*;

import java.util.List;

public interface BookService {
    PageBean<Book> page(Integer page, Integer pageSize, String bookName, String classification, String author, String publisher);


    void addBook(Book book);

    void updateBook(Book book);

    boolean isExist(String bookName);

    void deleteBook(List<Integer> ids);

    void deleteAuthorById(List<Integer> id);

    boolean classificationExist(String classification);

    void updateC(Classification classification);

    void addC(String classification);

    void deleteC(Integer id);

    PageBean<Classification> pageC(Integer page, Integer pageSize, String classification);

    void cancelAuthorById(Integer id);

    List<Classification> searchAllC();

    List<Publisher> searchAllP();
}
