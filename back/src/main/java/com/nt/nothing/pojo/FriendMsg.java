package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/9 5:23
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "好友状态存储信息")
public class FriendMsg {
    @Schema(description = "好友申请申请方用户id")
    private Integer send;
    @Schema(description = "好友申请被申请方用户id")
    private Integer receive;
    @Schema(description = "好友申请状态")
    private Integer state;
}
