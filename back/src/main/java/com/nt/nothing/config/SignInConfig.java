package com.nt.nothing.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 13:18
 */

@Data
@Component
@ConfigurationProperties(prefix = "attendance")
public class SignInConfig {
    private Double signInPrize;
}
