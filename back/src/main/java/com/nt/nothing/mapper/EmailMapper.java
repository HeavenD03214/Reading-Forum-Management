package com.nt.nothing.mapper;

import com.nt.nothing.pojo.Email;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface EmailMapper {
    @Insert("insert into verification_codes(email, code, time) " +
            "values (#{email},#{code},#{time}) ")
    public void inser(Email email);
    @Select("SELECT * FROM verification_codes WHERE email = #{email} AND code = #{code} AND time > #{time}")
    public Email findByEmailAndCodeAndExpiryTime(Email email);

    @Delete("DELETE FROM verification_codes where email = #{email}")
    public void delete(Email email);
}
