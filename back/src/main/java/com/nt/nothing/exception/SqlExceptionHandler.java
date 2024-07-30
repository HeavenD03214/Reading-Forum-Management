package com.nt.nothing.exception;

import com.nt.nothing.pojo.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.sql.SQLIntegrityConstraintViolationException;


@RestControllerAdvice
public class SqlExceptionHandler {

    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public Result ex(Exception ex){
        ex.printStackTrace();
        return new Result<String>().error("操作失败，请重新操作或联系管理员");
    }
}
