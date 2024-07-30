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
@Schema(description = "管理员信息")
public class Admin {
    @Schema(description = "管理员id")
    private Integer id;
    @Schema(description = "管理员对应用户id")
    private Integer user_id;
}
