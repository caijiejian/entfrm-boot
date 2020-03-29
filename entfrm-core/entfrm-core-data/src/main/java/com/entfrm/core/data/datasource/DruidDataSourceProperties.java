package com.entfrm.core.data.datasource;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

/**
 * @author yong
 * @date 2020/2/1
 *
 * 参考DruidDataSourceWrapper
 */
@Data
@Component
@ConfigurationProperties("spring.datasource.druid")
public class DruidDataSourceProperties {
	private String username;
	private String password;
	private String jdbcUrl;
	private String driverClassName;
}
