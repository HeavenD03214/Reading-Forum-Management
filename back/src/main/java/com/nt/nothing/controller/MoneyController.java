package com.nt.nothing.controller;

import com.nt.nothing.mapper.MoneyMapper;
import com.nt.nothing.pojo.Result;
import com.nt.nothing.pojo.User;
import com.nt.nothing.service.MoneyService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/7 21:11
 */

@Slf4j
@RestController
@Tag(name = "积分管理")
@CrossOrigin(origins = "*")
@RequestMapping("/money")
public class MoneyController {

    @Autowired
    private MoneyService moneyService;

    //充值
    @Operation(summary = "充值接口")
    @PostMapping("/recharge")
    public Result<String> recharge(@RequestBody User user) {
        return new Result<String>().success("充值成功");
    }

    @Operation(summary = "更新积分接口")
    @PostMapping("/update")
    public Result<String> update(@RequestParam Integer id,@RequestParam Double balance) {

        moneyService.update(id,balance);
        return new Result<String>().success("修改成功");
    }

}
