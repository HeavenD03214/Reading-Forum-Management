package com.nt.nothing.controller;

import com.nt.nothing.anno.Log;
import com.nt.nothing.pojo.*;
import com.nt.nothing.service.BookService;
import com.nt.nothing.service.MoneyService;
import com.nt.nothing.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description 管理员操作管理
 * @Author HeavenDirt
 * @Date 2024/7/5 15:40
 */

@Slf4j
@RestController
@Tag(name = "管理员管理")
@CrossOrigin(origins = "*")
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;

    //增加
    @Log
    @Operation(summary = "管理员添加接口")
    @PostMapping("/add/{id}")
    public Result<String> add(@PathVariable Integer id){
        if(userService.isAdmin(id)) return new Result<String>().error("用户已是管理员");
        userService.addAdmin(id);
        return new Result<String>().success("添加成功");
    }

    //删除管理员在管理员表中进行,此处id为管理员序号
    @Log
    @Operation(summary = "管理员删除接口(通过用户id)")
    @DeleteMapping("/delete/{ids}")
    public Result<String> delete(@PathVariable List<Integer> ids){
        userService.deleteAdmin(ids);
        return new Result<String>().success("管理员删除成功");
    }

    //查询
    @Operation(summary = "管理员查询接口")
    @GetMapping("/search")
    public Result<PageBean<searchAdmin>> page(@RequestParam(defaultValue = "1") Integer page,
                                              @RequestParam(defaultValue = "10") Integer pageSize,
                                              String username, String name, Short gender, String province, String area){
        log.info("分页查询, 参数: {},{},{},{},{},{},{}",
                page,pageSize,username,name,gender,province,area);
        //调用service分页查询
        PageBean<searchAdmin> pageBean = userService.pageAd(page,
                pageSize,username,name,gender,province,area);
        return new Result<PageBean<searchAdmin>>().success(pageBean);
    }


    //管理员统查
    @Operation(summary = "管理员查询所有用户接口")
    @GetMapping("/searchAll")
    public Result<PageBean<searchAll>> pageAll(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize,
                       String username, String name,Short gender,String province,String area){
        log.info("分页查询, 参数: {},{},{},{},{},{},{}",
                page,pageSize,username,name,gender,province,area);
        //调用service分页查询
        PageBean<searchAll> pageBean = userService.pageAll(page,
                pageSize,username,name,gender,province,area);
        return new Result<PageBean<searchAll>>().success(pageBean);
    }

}
