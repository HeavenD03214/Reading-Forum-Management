package com.nt.nothing.controller;

import com.nt.nothing.pojo.Result;
import com.nt.nothing.service.EmailService;
import com.nt.nothing.service.impl.EmailServiceImpl;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 10:02
 */
@Slf4j
@RestController
@Tag(name = "邮箱验证管理")
@CrossOrigin(origins = "*")
public class EmailController {
    @Autowired
    EmailService scm;

    @Operation(summary = "邮箱发送接口")
    @GetMapping("/sendmail")
    public Result<String> sendMail(@RequestParam(defaultValue = "1989375151@qq.com") String email) {
        String codedata = scm.sendMail(email);
        log.info(codedata);
        if (codedata == null) {
            return new Result<String>().error("发生错误！");
        }else if(codedata.equals("1")){
            return new Result<String>().error("邮箱格式错误！");
        }else{
            return new Result<String>().success("发送成功");
        }
    }

    @Operation(summary = "邮箱验证接口")
    @GetMapping("/checkmail")
    public Result checkMail(@RequestParam String email, String code){
        if(scm.verifyCode(email,code)){
            return new Result<String>().success("邮箱验证成功");
        }else{
            return new Result<String>().error("验证码错误!");
        }

    }

}
