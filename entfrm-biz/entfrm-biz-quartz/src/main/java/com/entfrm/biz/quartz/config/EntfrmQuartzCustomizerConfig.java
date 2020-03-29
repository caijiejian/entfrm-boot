package com.entfrm.biz.quartz.config;

import org.springframework.boot.autoconfigure.quartz.SchedulerFactoryBeanCustomizer;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

/**
 *
 * @date 2019-06-28
 */
@Configuration
public class EntfrmQuartzCustomizerConfig implements SchedulerFactoryBeanCustomizer {
	@Override
	public void customize(SchedulerFactoryBean schedulerFactoryBean) {
		schedulerFactoryBean.setWaitForJobsToCompleteOnShutdown(true);
	}
}
