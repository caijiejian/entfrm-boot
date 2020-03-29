package com.entfrm.biz.quartz.config;

import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import com.entfrm.biz.quartz.entity.Job;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 动态任务工厂
 *
 * @date 2019-06-28
 */
@Slf4j
@DisallowConcurrentExecution
public class EntfrmQuartzFactory implements org.quartz.Job {

	@Autowired
	private EntfrmQuartzInvokeFactory entfrmQuartzInvokeFactory;


	@Override
	@SneakyThrows
	public void execute(JobExecutionContext jobExecutionContext) {
		Job job = (Job) jobExecutionContext.getMergedJobDataMap().get(EntfrmQuartzEnum.SCHEDULE_JOB_KEY.getType());
		entfrmQuartzInvokeFactory.init(job, jobExecutionContext.getTrigger());
	}
}
