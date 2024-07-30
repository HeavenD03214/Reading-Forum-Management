package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 22:40
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "抽卡奖励信息")
public class CardResult {
    @Schema(description = "卡名")
    private String name;
    @Schema(description = "卡面")
    private String image;
    @Schema(description = "卡稀有度")
    private String level;
}
