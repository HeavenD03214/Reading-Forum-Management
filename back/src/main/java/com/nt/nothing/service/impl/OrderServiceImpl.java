package com.nt.nothing.service.impl;

import com.nt.nothing.AliPay.Order;
import com.nt.nothing.mapper.OrderMapper;
import com.nt.nothing.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/10 23:09
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderMapper orderMapper;

    @Override
    public void addOrder(Order order) {
        orderMapper.addOrder(order);
    }

    @Override
    public Integer getUserIdByUid(String tradeNo) {
        return orderMapper.getUserIdByUid(tradeNo);
    }

    @Override
    public void updateOrderState(String tradeNo) {
        orderMapper.updateOrderState(tradeNo);
    }
}
