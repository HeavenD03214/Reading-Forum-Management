package com.nt.nothing.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.nt.nothing.mapper.BookMapper;
import com.nt.nothing.mapper.UserMapper;
import com.nt.nothing.pojo.*;
import com.nt.nothing.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/5 15:49
 */

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageBean<Book> page(Integer page, Integer pageSize, String book_name, String classification, String author, String publisher) {
        PageHelper.startPage(page,pageSize);

        //2. 执行查询
        List<Book> bookList = bookMapper.list(book_name,classification,author,publisher);
        Page<Book> p = (Page<Book>) bookList;

        //3. 封装PageBean对象
        return new PageBean<Book>(p.getTotal(), p.getResult());
    }

    @Override
    public void addBook(Book book) {
        //作者id
        Integer author = userMapper.getAuthorIdByAuthorName(book.getAuthor());
        //类别id
        Integer classification = userMapper.getclassificationByName(book.getClassification());
        //出版商id
        Integer publisher = userMapper.getpublisherByName(book.getPublisher());
        if(author!=null && classification!=null && publisher!=null){
            bookMapper.addBook(new dBook(null, book.getBook_name(),author,classification,publisher,book.getIntro()));
        }
    }

    @Override
    public void updateBook(Book book) {
        //作者id
        Integer author = userMapper.getAuthorIdByAuthorName(book.getAuthor());
        //类别id
        Integer classification = userMapper.getclassificationByName(book.getClassification());
        //出版商id
        Integer publisher = userMapper.getpublisherByName(book.getPublisher());
        if(author!=null && classification!=null && publisher!=null) {
            bookMapper.updateBook(new dBook(book.getId(), book.getBook_name(), author, classification, publisher, book.getIntro()));
        }
    }

    @Override
    public boolean isExist(String bookName) {
        if(bookMapper.isExistByBookName(bookName) != 0) return true;
        return false;
    }

    @Override
    public void deleteBook(List<Integer> ids) {
        bookMapper.deleteByIds(ids);
    }




    //通过id删除作者,此处id是作者序号
    @Override
    public void deleteAuthorById(List<Integer> ids) {
        for(Integer id : ids){
            bookMapper.deleteById(id);
        }
        userMapper.deleteAuthorById(ids);
    }



    //书的类别服务
    @Override
    public boolean classificationExist(String classification) {
        if(bookMapper.cExistByCName(classification) != 0) return true;
        return false;
    }

    @Override
    public void updateC(Classification classification) {
        //更新类别表
        bookMapper.updateC(classification);
    }

    @Override
    public void addC(String classification) {
        bookMapper.addC(classification);
    }

    @Override
    public void deleteC(Integer id) {
        //删除书
        bookMapper.deleteByC(id);
        // 删除表的同时
        bookMapper.deleteC(id);
    }

    @Override
    public PageBean<Classification> pageC(Integer page, Integer pageSize, String classification) {
        PageHelper.startPage(page,pageSize);

        //2. 执行查询
        List<Classification> classificationList = bookMapper.listC(classification);
        Page<Classification> p = (Page<Classification>) classificationList;

        //3. 封装PageBean对象
        return new PageBean<>(p.getTotal(), p.getResult());
    }


    //此处id是用户id
    @Override
    public void cancelAuthorById(Integer id) {
        bookMapper.deleteById(userMapper.searchAuthor(id).getId());
        userMapper.cancelAuthorById(id);
    }

    @Override
    public List<Classification> searchAllC() {
        return bookMapper.searchAllC();
    }

    @Override
    public List<Publisher> searchAllP() {
        return bookMapper.searchAllP();
    }
}
