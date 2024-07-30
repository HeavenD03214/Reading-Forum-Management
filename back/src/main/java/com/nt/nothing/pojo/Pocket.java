package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/7 14:07
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pocket {
    @Schema(description = "钱包id")
    private Integer id;
    @Schema(description = "用户id")
    private Integer user_id;
    @Schema(description = "余额")
    private Double balance = 0.0;
}
