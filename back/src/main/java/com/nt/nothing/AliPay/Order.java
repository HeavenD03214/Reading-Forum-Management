package com.nt.nothing.AliPay;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.models.security.SecurityScheme;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/10 22:42
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "订单信息")
public class Order {
    @Schema(description = "订单号")
    private String uid;
    @Schema(description = "订单创建用户id")
    private Integer userId;
    @Schema(description = "订单金额")
    private Double amount;
    @Schema(description = "订单创建时间")
    private LocalDateTime time;
    @Schema(description = "订单状态")
    private Integer state;
}
