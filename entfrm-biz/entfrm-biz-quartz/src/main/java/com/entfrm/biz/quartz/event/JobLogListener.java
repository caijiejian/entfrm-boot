package com.entfrm.biz.quartz.event;

import com.entfrm.biz.quartz.entity.JobLog;
import com.entfrm.biz.quartz.service.JobLogService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 * 异步监听定时任务日志事件
 *
 * @date 2019-06-28
 */
@Slf4j
@AllArgsConstructor
public class JobLogListener {

	private JobLogService jobLogService;

	@Async
	@Order
	@EventListener(JobLogEvent.class)
	public void saveJobLog(JobLogEvent event) {
		JobLog jobLog = (JobLog) event.getJobLog();
		jobLogService.save(jobLog);
		log.info("执行定时任务日志");
	}
}
