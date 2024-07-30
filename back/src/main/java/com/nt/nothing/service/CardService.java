package com.nt.nothing.service;

import com.nt.nothing.pojo.CardResult;

public interface CardService {
    Double getBalanceByLevel(String level);


    CardResult getCardBalanceResult(String level);
}
