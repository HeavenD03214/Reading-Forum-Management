package com.nt.nothing.controller;

import com.nt.nothing.config.CardLevelConfig;
import com.nt.nothing.pojo.Book;
import com.nt.nothing.pojo.CardResult;
import com.nt.nothing.pojo.PageBean;
import com.nt.nothing.pojo.Result;
import com.nt.nothing.service.CardService;
import com.nt.nothing.service.MoneyService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 22:39
 */

@Slf4j
@RestController
@Tag(name = "抽卡管理")
@CrossOrigin(origins = "*")
@RequestMapping("/card")
public class CardController {

    @Resource
    CardLevelConfig cardLevelConfig;

    @Autowired
    CardService cardService;

    @Autowired
    MoneyService moneyService;


    @Operation(summary = "抽卡接口")
    @GetMapping("/play")
    public Result<List<CardResult>> play(Integer id,Integer num){
        //S - 10
        //A - 20
        //B - 70
        List<CardResult> cardResults = new ArrayList<>();
        Random random = new Random();
        int randomNumber = 0;
        Integer levelA = cardLevelConfig.getLevelA();
        Integer levelS = cardLevelConfig.getLevelS();
        Double price = cardLevelConfig.getPrice();
        Integer denominator = cardLevelConfig.getDenominator();
        Double balance = moneyService.getBalanceById(id) - (price * num);
        moneyService.update(id,balance);

        if(balance < 0) {
            return new Result<List<CardResult>>().error(cardResults);
        }
        String level = "";
        String type = "balance";


        for(int i = 0;i<num;i++){
            Double money = moneyService.getBalanceById(id);
            randomNumber = random.nextInt(denominator) + 1;
            //抽到S
            if(randomNumber <= levelS){
                level = "S";
            }
            //抽到A
            else if(randomNumber <= levelS + levelA){
                level = "A";
            }
            //抽到B
            else {
                level = "B";
            }

            if(type.equals("balance")){
                moneyService.update(id,money + cardService.getBalanceByLevel(level));
                cardResults.add(cardService.getCardBalanceResult(level));
            }
        }

        return new Result<List<CardResult>>().success(cardResults);
    }
}
