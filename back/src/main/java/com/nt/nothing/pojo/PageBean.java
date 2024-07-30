package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "分页信息")
public class PageBean<T> {

    @Schema(description = "总记录数")
    private Long total;
    @Schema(description = "数据列表")
    private List<T> rows;

}