package com.entfrm.biz.quartz.config;

import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import com.entfrm.biz.quartz.util.TaskUtil;
import com.entfrm.biz.quartz.service.JobService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.quartz.Scheduler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 初始化加载定时任务
 *
 * @date 2019-06-28
 */
@Slf4j
@Configuration
@AllArgsConstructor
public class EntfrmInitQuartzJob {
	private final JobService jobService;
	private final TaskUtil taskUtil;
	private final Scheduler scheduler;

	@Bean
	public void customize() {
		jobService.list().forEach(job -> {
			if (EntfrmQuartzEnum.JOB_STATUS_RELEASE.getType().equals(job.getJobStatus())) {
				taskUtil.removeJob(job, scheduler);
			} else if (EntfrmQuartzEnum.JOB_STATUS_RUNNING.getType().equals(job.getJobStatus())) {
				taskUtil.resumeJob(job, scheduler);
			} else if (EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType().equals(job.getJobStatus())) {
				taskUtil.pauseJob(job, scheduler);
			} else {
				taskUtil.removeJob(job, scheduler);
			}
		});
	}
}
