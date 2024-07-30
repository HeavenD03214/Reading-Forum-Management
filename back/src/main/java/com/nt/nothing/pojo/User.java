package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * @Description 用户类，存储用户信息
 * @Author HeavenDirt
 * @Date 2024/7/5 14:33
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "用户登录类")
public class User {
    @Schema(description = "用户id")
    private Integer id;
    @Schema(description = "用户名")
    private String username;
    @Schema(description = "密码")
    private String password;
    @Schema(description = "昵称")
    private String name;
    @Schema(description = "性别")
    private Short gender;
    @Schema(description = "头像")
    private String image;
    @Schema(description = "邮箱")
    private String email;
    @Schema(description = "省份")
    private String province;
    @Schema(description = "地区")
    private String area;
    @Schema(description = "生日")
    private LocalDate birthday;
    @Schema(description = "邮编")
    private String emailcode;
}
