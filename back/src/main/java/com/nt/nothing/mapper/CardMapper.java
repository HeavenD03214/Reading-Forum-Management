package com.nt.nothing.mapper;

import com.nt.nothing.pojo.CardResult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CardMapper {
    Double getBalanceByLevel(String level);


    CardResult getCardBalanceResult(String level);
}
