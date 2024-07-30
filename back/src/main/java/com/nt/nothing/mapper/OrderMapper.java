package com.nt.nothing.mapper;

import com.nt.nothing.AliPay.Order;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
    void addOrder(Order order);

    Integer getUserIdByUid(String tradeNo);

    void updateOrderState(String tradeNo);
}
