package com.entfrm.auth.config;

import com.entfrm.core.base.config.GlobalConfig;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author yong
 * @date 2020/3/10
 * @description 资源服务器配置
 */
@Configuration
@EnableResourceServer
@AllArgsConstructor
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class ResourceServerConfig extends ResourceServerConfigurerAdapter implements WebMvcConfigurer {

    @Override
    @SneakyThrows
    public void configure(HttpSecurity http) {
        http
                // CRSF禁用，因为不使用session
                .csrf().disable()
                .authorizeRequests()
                .antMatchers(
                        "/oauth/**", "/common/**",
                        "/actuator/**" ).permitAll()
                .anyRequest().authenticated()
                .and().csrf().disable();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        /** 本地文件上传路径 */
        registry.addResourceHandler("/profile/**" ).addResourceLocations("file:" + GlobalConfig.getProfile() + "/" );
    }

}

