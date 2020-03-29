package com.entfrm.biz.quartz.config;

import com.entfrm.biz.quartz.event.JobEvent;
import com.entfrm.biz.quartz.entity.Job;
import lombok.AllArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.quartz.Trigger;
import org.springframework.context.ApplicationEventPublisher;

/**
 *
 * @date 2019-06-28
 */
@Aspect
@Slf4j
@AllArgsConstructor
public class EntfrmQuartzInvokeFactory {

	private final ApplicationEventPublisher publisher;

	@SneakyThrows
	void init(Job job, Trigger trigger) {
		publisher.publishEvent(new JobEvent(job, trigger));
	}
}
