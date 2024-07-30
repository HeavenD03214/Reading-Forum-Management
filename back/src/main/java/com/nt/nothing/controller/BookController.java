package com.nt.nothing.controller;

import com.nt.nothing.anno.Log;
import com.nt.nothing.pojo.*;
import com.nt.nothing.service.BookService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/7 10:30
 */

@Slf4j
@RestController
@Tag(name = "书籍管理")
@CrossOrigin(origins = "*")
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @Log
    @Operation(summary = "增加书籍接口")
    @PostMapping("/add")
    public Result<String> addBook(@RequestBody Book book){
        log.info("新添加书籍:{}",book);
        if (bookService.isExist(book.getBook_name())) return new Result<String>().error("书名已存在");
        bookService.addBook(book);
        return new Result<String>().success("添加成功");
    }

    @Log
    @Operation(summary = "书籍更新接口")
    @PostMapping("/update")
    public Result<String> updateBook(@RequestBody Book book){
        log.info("更新书籍:{}",book);
        bookService.updateBook(book);
        return new Result<String>().success("更新成功");
    }

    @Log
    @Operation(summary = "书籍批量删除接口")
    @DeleteMapping("/delete/{ids}")
    public Result<String> deleteBook(@PathVariable List<Integer> ids){
        log.info("删除书籍id:{}",ids);
        bookService.deleteBook(ids);
        return new Result<String>().success("删除成功");
    }

    //查阅书籍
    @Operation(summary = "书籍查询接口")
    @GetMapping("/search")
    public Result<PageBean<Book>> page(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize,
                       String book_name,String classification,String author,String publisher){
        log.info("分页查询, 参数: {},{},{},{},{},{}",page,pageSize,book_name,classification,author,publisher);
        //调用service分页查询
        PageBean<Book> pageBean = bookService.page(page,pageSize,book_name,classification,author,publisher);
        return new Result<PageBean<Book>>().success(pageBean);
    }


    @Operation(summary = "查询所有发行商接口")
    @GetMapping("/searchAllP")
    public Result<List<Publisher>> searchAllP(){
        //调用service分页查询
        List<Publisher> publishers =  bookService.searchAllP();

        return new Result<List<Publisher>>().success(publishers);
    }

}
