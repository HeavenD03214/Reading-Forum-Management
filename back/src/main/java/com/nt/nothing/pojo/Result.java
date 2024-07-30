package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Schema(description = "统一结果返回信息")
public class Result<T> {
    @Schema(description = "响应码，1 代表成功; 0 代表失败")
    private Integer code;//
    @Schema(description = "响应信息 描述字符串")
    private String msg;  //
    @Schema(description = "返回的数据")
    private T data; //

    //增删改 成功响应
    public  Result<T> success(){
        return new Result<T>(1,"success",null);
    }
    //查询 成功响应
    public Result<T> success(T data){
        return new Result<T>(1,"success",data);
    }
    //失败响应
    public Result<T> error(T data){
        return new Result<T>(0,"error",data);
    }
}
