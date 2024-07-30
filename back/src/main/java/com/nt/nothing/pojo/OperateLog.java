package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "操作信息")
public class OperateLog {
    @Schema(description = "ID")
    private Integer id;
    @Schema(description = "操作人ID")
    private Integer operateUser;
    @Schema(description = "操作时间")
    private LocalDateTime operateTime;
    @Schema(description = "操作类名")
    private String className;
    @Schema(description = "操作方法名")
    private String methodName;
    @Schema(description = "操作方法参数")
    private String methodParams;
    @Schema(description = "操作方法返回值")
    private String returnValue;
    @Schema(description = "操作耗时")
    private Long costTime;
}
