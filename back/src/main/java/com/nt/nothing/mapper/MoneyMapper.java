package com.nt.nothing.mapper;

import com.nt.nothing.pojo.Pocket;
import com.nt.nothing.pojo.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MoneyMapper {

    void addUser(Pocket pocket);

    void deleteByUserId(Integer id);

    void update(Integer id, Double balance);

    Double getBalanceById(Integer id);
}
