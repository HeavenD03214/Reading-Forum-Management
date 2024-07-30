package com.nt.nothing.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 22:55
 */

@Data
@Component
@ConfigurationProperties(prefix = "card-level")
public class CardLevelConfig {
    private Integer levelB;
    private Integer levelA;
    private Integer levelS;
    private Integer denominator;
    private Double price;
}
