package com.nt.nothing.controller;

import com.nt.nothing.pojo.LoginMsg;
import com.nt.nothing.pojo.Result;
import com.nt.nothing.pojo.User;
import com.nt.nothing.service.UserService;
import com.nt.nothing.utils.JwtUtils;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@Tag(name = "登录管理")
@CrossOrigin(origins = "*")
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userService;
    @PostMapping
    public Result<LoginMsg> login(@RequestBody User user){
        log.info("员工登录:{}",user);
        User e = userService.Login(user);

        if(e != null){
            Map<String, Object> claims = new HashMap<>();
            claims.put("id", e.getId());
            claims.put("username", e.getUsername());
            String jwt = JwtUtils.generateJwt(claims);//jwt包含了当前登录的员工信息
            e.setPassword("");
            return new Result<LoginMsg>().success(new LoginMsg(jwt,e,userService.isAdmin(e.getId()),userService.isAuthor(e.getId()),userService.getBalance(e.getId())));
        }
        return new Result<LoginMsg>().error(new LoginMsg());
    }
}
