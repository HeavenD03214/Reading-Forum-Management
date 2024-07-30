package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/5 15:06
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "书籍信息")
public class Book {
    @Schema(description = "书籍id")
    private Integer id;
    @Schema(description = "书名")
    private String book_name;
    @Schema(description = "作者")
    private String author;
    @Schema(description = "分类")
    private String classification;
    @Schema(description = "发行商")
    private String publisher;
    @Schema(description = "简介")
    private String intro;
}
