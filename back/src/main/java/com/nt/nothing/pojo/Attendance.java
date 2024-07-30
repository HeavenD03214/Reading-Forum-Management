package com.nt.nothing.pojo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/9 19:33
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "签到信息")
public class Attendance {
    @Schema(description = "用户id")
    private Integer id;
    @Schema(description = "签到时间")
    private LocalDate time;
}
