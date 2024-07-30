package com.nt.nothing.controller;

import com.nt.nothing.anno.Log;
import com.nt.nothing.config.AuthorConfig;
import com.nt.nothing.pojo.*;
import com.nt.nothing.service.BookService;
import com.nt.nothing.service.MoneyService;
import com.nt.nothing.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/7 21:10
 */

@Slf4j
@RestController
@Tag(name = "作者管理")
@CrossOrigin(origins = "*")
@RequestMapping("/author")
public class AuthorController {

    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;

    @Autowired
    private MoneyService moneyService;

    @Resource
    private AuthorConfig authorConfig;

    //用户自己注销
    @Log
    @Operation(summary = "作者权限注销接口")
    @DeleteMapping("/cancel/{id}")
    public Result<String> deleteAuthor(@PathVariable Integer id){
        log.info("注销作者权限:{}",id);
        bookService.cancelAuthorById(id);
        return new Result<String>().success("注销成功");
    }

    //管理员批量删除
    @Log
    @Operation(summary = "管理员批量删除作者接口")
    @DeleteMapping("/delete/{ids}")
    public Result<String> deleteAuthor(@PathVariable List<Integer> ids){
        log.info("注销作者权限:{}",ids);
        bookService.deleteAuthorById(ids);
        return new Result<String>().success("删除成功");
    }

    //根据用户id更新笔名
    @Log
    @Operation(summary = "作者更新笔名接口")
    @PostMapping("/update")
    public Result<String> update(@RequestBody Author author){
        userService.authorUpdate(author);
        return new Result<String>().success("更新成功");
    }
    //增加

    @Log
    @Operation(summary = "成为作者接口")
    @PostMapping("/beAuthor")
    public Result<String> beAuthor(@RequestParam Integer id,@RequestParam String name){
        if(userService.isAuthor(id)) return new Result<String>().error("用户已是作者");
        Double balance = userService.getBalance(id);
        Double registerMoney = authorConfig.getRegisterMoney();
        if(balance.compareTo(registerMoney) < 0) return new Result<String>().error("你太穷了");
        moneyService.update(id,balance - registerMoney);
        userService.addAuthor(id,name);
        return new Result<String>().success("成为作者成功");
    }

    @Log
    @Operation(summary = "管理员添加作者接口")
    @PostMapping("/add/{id}")
    public Result<String> add(@PathVariable Integer id){
        if(userService.isAuthor(id)) return new Result<String>().error("用户已是作者");
        userService.addAuthorByid(id);
        return new Result<String>().success("作者添加成功");
    }


    @Operation(summary = "作者查询接口")
    //查询
    @GetMapping("/search")
    public Result<PageBean<searchAuthor>> page(@RequestParam(defaultValue = "1") Integer page,
                                     @RequestParam(defaultValue = "10") Integer pageSize,
                                     String authorName, String username,
                                     String name, Short gender, String province, String area){
        log.info("分页查询, 参数: {},{},{},{},{},{},{},{}",
                page,pageSize,authorName,username,name,gender,province,area);
        //调用service分页查询
        PageBean<searchAuthor> pageBean = userService.pageA(page,
                pageSize,authorName,username,name,gender,province,area);
        return new Result<PageBean<searchAuthor>>().success(pageBean);
    }
}
