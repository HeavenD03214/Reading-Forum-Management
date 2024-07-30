package com.nt.nothing.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 12:41
 */
@Data
@Component
@ConfigurationProperties(prefix = "author")
public class AuthorConfig {
    private Double registerMoney;
}
