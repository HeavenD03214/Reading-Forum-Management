package com.nt.nothing.service.impl;

import com.nt.nothing.mapper.MoneyMapper;
import com.nt.nothing.pojo.Pocket;
import com.nt.nothing.pojo.User;
import com.nt.nothing.service.MoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/7 14:02
 */
@Service
public class MoneyServiceImpl implements MoneyService {

    @Autowired
    private MoneyMapper moneyMapper;

    @Override
    public void addUser(User user) {
        Pocket pocket = new Pocket();
        pocket.setUser_id(user.getId());
        moneyMapper.addUser(pocket);
    }

    @Override
    public void update(Integer id, Double balance) {
        moneyMapper.update(id,balance);
    }

    @Override
    public Double getBalanceById(Integer id) {
        return moneyMapper.getBalanceById(id);
    }
}
