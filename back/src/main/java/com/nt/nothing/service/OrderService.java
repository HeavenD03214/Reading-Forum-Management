package com.nt.nothing.service;

import com.nt.nothing.AliPay.Order;

public interface OrderService {
    void addOrder(Order order);

    Integer getUserIdByUid(String tradeNo);

    void updateOrderState(String tradeNo);
}
