package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/9 7:42
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "好友状态查询信息")
public class FriendList {
    @Schema(description = "好友用户id")
    private Integer id;
    @Schema(description = "好友昵称")
    private String name;
    @Schema(description = "好友用户名")
    private String username;
    @Schema(description = "最新消息")
    private String msg;
    @Schema(description = "最新消息发送时间")
    private LocalDateTime time;
    @Schema(description = "未读消息数")
    private Integer unRead;
    @Schema(description = "最新消息发送方id")
    private Integer send;
    @Schema(description = "头像")
    private String image;
}
