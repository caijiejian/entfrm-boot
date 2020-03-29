package com.entfrm.biz.quartz.task;

import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 测试SpringBean调用的demo
 *
 * @author entfrm
 * @date 2019-06-28
 */
@Slf4j
@Component("demo")
public class SpringBeanTaskDemo {
	/**
	 * 测试Spring Bean的演示方法
	 */
	@SneakyThrows
	public String demoMethod(String para) {
		log.info("测试于:{}，输入参数{}", LocalDateTime.now(), para);
		return EntfrmQuartzEnum.JOB_LOG_STATUS_SUCCESS.getType();
	}
}
