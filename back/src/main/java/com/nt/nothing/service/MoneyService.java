package com.nt.nothing.service;

import com.nt.nothing.pojo.User;

public interface MoneyService {
    void addUser(User user);

    void update(Integer id, Double balance);

    Double getBalanceById(Integer id);
}
