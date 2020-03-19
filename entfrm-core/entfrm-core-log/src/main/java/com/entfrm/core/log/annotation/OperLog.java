package com.entfrm.core.log.annotation;

import java.lang.annotation.*;

/**
 * @author yong
 * @date 2019/11/28
 * 操作日志注解
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface OperLog {
    /**
     * 描述
     *
     * @return {String}
     */
    String value();
}
