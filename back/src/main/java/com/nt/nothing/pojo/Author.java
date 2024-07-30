package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/7 10:38
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "作者信息")
public class Author {
    @Schema(description = "作者id")
    int id;
    @Schema(description = "作者笔名")
    String name;
    @Schema(description = "作者对应用户id")
    int user_id;
}
