package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/9 6:13
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "好友申请信息")
public class FriendRequest {
    @Schema(description = "申请人id")
    private Integer id;
    @Schema(description = "申请人用户名")
    private String username;
    @Schema(description = "申请人昵称")
    private String name;
    @Schema(description = "申请人性别")
    private Short gender;
    @Schema(description = "申请人头像")
    private String image;
}
