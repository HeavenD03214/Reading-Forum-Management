package com.nt.nothing.controller;

import com.nt.nothing.pojo.Result;
import com.nt.nothing.pojo.User;
import com.nt.nothing.service.MoneyService;
import com.nt.nothing.service.UserService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Description
 * @Author HeavenDirt
 * @Date 2024/7/5 15:24
 */

@Slf4j
@RestController
@Tag(name = "注册管理")
@CrossOrigin(origins = "*")
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    private UserService userService;

    @Autowired
    private MoneyService moneyService;

    @PostMapping
    public Result<String> register(@RequestBody User user){
        log.info("新注册成员:{}",user);

        if (userService.isExist(user.getUsername())) return new Result<String>().error("用户名已存在");
        //用户表添加用户
        userService.register(user);
        user.setId(userService.searchIdByUserName(user.getUsername()));
        //余额表添加用户
        moneyService.addUser(user);

        return new Result<String>().success("注册成功");
    }

}
