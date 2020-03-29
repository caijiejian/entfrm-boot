package com.entfrm.biz.quartz.event;

import com.entfrm.biz.quartz.util.TaskInvokUtil;
import com.entfrm.biz.quartz.entity.Job;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Trigger;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 * 异步监听定时任务事件
 *
 * @date 2019-06-28
 */
@Slf4j
@AllArgsConstructor
public class JobListener {

	private TaskInvokUtil taskInvokUtil;

	@Async
	@Order
	@EventListener(JobEvent.class)
	public void comJob(JobEvent event) {
		Job job = event.getJob();
		Trigger trigger = event.getTrigger();
		taskInvokUtil.invokMethod(job, trigger);
	}
}
