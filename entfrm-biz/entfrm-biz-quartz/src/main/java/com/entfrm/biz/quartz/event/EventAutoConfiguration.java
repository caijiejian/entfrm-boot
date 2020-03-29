package com.entfrm.biz.quartz.event;

import com.entfrm.biz.quartz.util.TaskInvokUtil;
import com.entfrm.biz.quartz.config.EntfrmQuartzInvokeFactory;
import com.entfrm.biz.quartz.service.JobLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

/**
 * 多线程自动配置
 *
 * @date 2019-06-28
 */
@EnableAsync
@Configuration
@ConditionalOnWebApplication
public class EventAutoConfiguration {
	@Autowired
	private TaskInvokUtil taskInvokUtil;
	@Autowired
	private JobLogService jobLogService;

	@Bean
	public JobListener jobListener() {
		return new JobListener(taskInvokUtil);
	}

	@Bean
	public EntfrmQuartzInvokeFactory tmQuartzInvokeFactory(ApplicationEventPublisher publisher) {
		return new EntfrmQuartzInvokeFactory(publisher);
	}

	@Bean
	public JobLogListener jobLogListener() {
		return new JobLogListener(jobLogService);
	}

	@Bean
	public TaskInvokUtil taskInvokUtil(ApplicationEventPublisher publisher) {
		return new TaskInvokUtil(publisher);
	}

}
