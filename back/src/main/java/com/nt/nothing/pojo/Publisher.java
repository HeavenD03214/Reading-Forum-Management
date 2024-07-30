package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 16:08
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "发行商信息")
public class Publisher {
    Integer id;
    String publisher;
}
