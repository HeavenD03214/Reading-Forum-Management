package com.nt.nothing.controller;

import com.nt.nothing.pojo.Classification;
import com.nt.nothing.pojo.PageBean;
import com.nt.nothing.pojo.Result;
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
 * @Date 2024/7/7 21:13
 */

@Slf4j
@RestController
@Tag(name = "书的类别管理")
@CrossOrigin(origins = "*")
@RequestMapping("/class")
public class ClassiController {

    @Autowired
    private BookService bookService;

    //书类别管理
    @Operation(summary = "添加书的类别接口")
    @PostMapping("/add")
    public Result<String> addC(String classification){
        log.info("新添加类别:{}",classification);
        if (bookService.classificationExist(classification)) return new Result<String>().error("类别已存在");
        bookService.addC(classification);
        return new Result<String>().success("添加成功");
    }

    @Operation(summary = "更新书的类别接口")
    @PostMapping("/update")
    public Result<String> updateC(@RequestBody Classification classification){
        log.info("更新类别:{}",classification);
        bookService.updateC(classification);
        return new Result<String>().success("更新成功");
    }


    @Operation(summary = "删除书的类别接口")
    @DeleteMapping("/delete/{id}")
    public Result<String> deleteC(@PathVariable Integer id){
        log.info("删除类别id:{}",id);
        bookService.deleteC(id);
        return new Result<String>().success("删除成功");
    }

    //查阅类别
    @Operation(summary = "查询类别接口")
    @GetMapping("/search")
    public Result<PageBean<Classification>> page(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize,
                       String classification){
        log.info("分页查询, 参数: {},{},{}",page,pageSize,classification);
        //调用service分页查询
        PageBean<Classification> pageBean = bookService.pageC(page,pageSize,classification);
        return new Result<PageBean<Classification>>().success(pageBean);
    }


    @Operation(summary = "查询所有类别接口")
    @GetMapping("/searchAll")
    public Result<List<Classification>> searchAll(){
        //调用service分页查询
        List<Classification> classifications =  bookService.searchAllC();

        return new Result<List<Classification>>().success(classifications);
    }



}
