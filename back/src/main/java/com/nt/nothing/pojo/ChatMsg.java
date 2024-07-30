package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/9 5:22
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "消息查询信息")
public class ChatMsg {
    @Schema(description = "消息id")
    private Integer id;
    @Schema(description = "消息发送方id")
    private Integer send;
    @Schema(description = "消息接收方id")
    private Integer receive;
    @Schema(description = "消息内容")
    private String msg;
    @Schema(description = "发送时间")
    private LocalDateTime time;
    @Schema(description = "消息状态")
    private Integer state;
}
