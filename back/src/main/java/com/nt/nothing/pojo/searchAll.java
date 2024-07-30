package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/8 14:11
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "查询全部用户信息")
public class searchAll {
    @Schema(description = "用户id")
    private Integer id;
    @Schema(description = "用户名")
    private String username;
    @Schema(description = "姓名")
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
    @Schema(description = "余额")
    private Double balance;
    @Schema(description = "作者")
    private Integer author;
    @Schema(description = "管理员")
    private Integer admin;
}
