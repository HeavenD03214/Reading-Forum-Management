package com.nt.nothing.controller;

import com.nt.nothing.config.SignInConfig;
import com.nt.nothing.pojo.*;
import com.nt.nothing.service.BookService;
import com.nt.nothing.service.MoneyService;
import com.nt.nothing.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.models.security.SecurityScheme;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Description 用户操作管理
 * @Author HeavenDirt
 * @Date 2024/7/5 15:24
 */

@Slf4j
@RestController
@Tag(name = "用户管理")
@CrossOrigin(origins = "*")
@RequestMapping("/user")
public class UserControler {

    @Autowired
    private UserService userService;

    @Autowired
    private MoneyService moneyService;

    @Resource
    private SignInConfig signInConfig;


    //增加用户
    @Operation(summary = "添加用户接口")
    @PostMapping("/add")
    public Result<String> add(@RequestBody User user) {
        userService.register(user);
        return new Result<String>().success("更新成功");
    }

    @Operation(summary = "根据id获取用户接口")
    @GetMapping("/{id}")
    public Result<searchAll> getUserById(@PathVariable Integer id) {
        searchAll allSearch =  userService.getById(id);
        return new Result<searchAll>().success(allSearch);
    }



    //更新自身数据
    @Operation(summary = "用户更新接口")
    @PostMapping("/userUpdate")
    public Result<String> userUpdate(@RequestBody User user) {
        log.info("更新信息:{}",user);
        userService.userUpdate(user);
        return new Result<String>().success("更新成功");
    }
    //修改密码
    @Operation(summary = "密码修改接口")
    @PostMapping("/passwordUpdate")
    public Result<String> passwordUpdate(@RequestBody User user) {
        userService.userUpdate(user);
        return new Result<String>().success("修改成功");
    }

    //注销
    @Operation(summary = "注销接口")
    @DeleteMapping("/cancel/{id}")
    public Result<String> cancel(@PathVariable Integer id) {
        if(userService.idExist(id)) {
            userService.deleteById(id);
            return new Result<String>().success("删除成功");
        }
        return new Result<String>().error("用户不存在");
    }

    //查阅用户
    @Operation(summary = "用户查询接口")
    @GetMapping("/search")
    public Result<PageBean<searchUser>> page(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize,
                       String name,Short gender ,String province,String area){
        log.info("分页查询, 参数: {},{},{},{},{},{}",
                page,pageSize,name,gender,province,area);
        //调用service分页查询
        PageBean<searchUser> pageBean = userService.page(page,pageSize,name,gender,province,area);
        return new Result<PageBean<searchUser>>().success(pageBean);
    }

    //管理员批量删除用户
    @Operation(summary = "管理员批量删除用户接口")
    @DeleteMapping("/delete/{ids}")
    public Result<String> deleteUser(@PathVariable List<Integer> ids){
        log.info("删除用户:{}",ids);
        userService.deleteUserById(ids);
        return new Result<String>().success("删除成功");
    }

    @Operation(summary = "用户签到接口")
    @PostMapping("/signIn/{id}")
    public Result<String> signIn(@PathVariable Integer id){
        log.info("签到用户:{}",id);
        if(userService.signIn(id)){
            Double balance = userService.getBalance(id);
            moneyService.update(id,balance + signInConfig.getSignInPrize());
            return  new Result<String>().success("签到成功");
        }
        return new Result<String>().error("你签你妈的到");
    }
}
