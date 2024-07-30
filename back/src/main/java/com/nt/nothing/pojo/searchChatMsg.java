package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/9 9:07
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "查询消息信息")
public class searchChatMsg {
    @Schema(description = "信息id")
    private Integer id;
    @Schema(description = "信息发送方id")
    private Integer send;
    @Schema(description = "发送方用户名")
    private String username;
    @Schema(description = "发送方姓名")
    private String name;
    @Schema(description = "发送消息内容")
    private String msg;
    @Schema(description = "发送时间")
    private LocalDateTime time;


}
