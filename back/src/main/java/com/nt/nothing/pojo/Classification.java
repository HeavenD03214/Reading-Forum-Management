package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/7 20:58
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "书的类别信息")
public class Classification {
    @Schema(description = "类别id")
    Integer id;
    @Schema(description = "类别名称")
    String classification;
}
