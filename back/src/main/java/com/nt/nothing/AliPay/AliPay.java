package com.nt.nothing.AliPay;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/10 20:03
 */
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
@Schema()
public class AliPay {
    private String traceNo;
    private Integer userId;
    private double totalAmount;
    private String subject;
    private Integer state = 0;
}

