package com.nt.nothing.service.impl;

import com.nt.nothing.mapper.CardMapper;
import com.nt.nothing.pojo.CardResult;
import com.nt.nothing.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 23:31
 */

@Service
public class CardServiceImpl implements CardService {

    @Autowired
    CardMapper cardMapper;

    @Override
    public Double getBalanceByLevel(String level) {
        return cardMapper.getBalanceByLevel(level);
    }

    @Override
    public CardResult getCardBalanceResult(String level) {
        return cardMapper.getCardBalanceResult(level);
    }

}
