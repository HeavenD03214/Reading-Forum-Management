package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description 返还登录信息
 * @Author HeavenDirt
 * @Date 2024/7/5 14:55
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "登录信息")
public class LoginMsg {
    @Schema(description = "令牌")
    private String token;
    @Schema(description = "登录用户信息")
    private User user;
    @Schema(description = "管理员状态")
    private Boolean isAdmin;
    @Schema(description = "作者状态")
    private Boolean isAuthor;
    @Schema(description = "积分")
    private Double balance;
}
