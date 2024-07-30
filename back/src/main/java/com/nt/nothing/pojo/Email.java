package com.nt.nothing.pojo;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 10:00
 */

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.annotations.Select;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "邮件实体类")
public class Email {
    private String email;
    private String code;
    private Date time;

}

