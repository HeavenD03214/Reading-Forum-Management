package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/7 20:18
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "书籍存储信息")
public class dBook {
    @Schema(description = "书籍id")
    private Integer id;
    @Schema(description = "书名")
    private String book_name;
    @Schema(description = "作者id")
    private Integer author;
    @Schema(description = "分类id")
    private Integer classification;
    @Schema(description = "发行商id")
    private Integer publisher;
    @Schema(description = "简介")
    private String intro;
}
