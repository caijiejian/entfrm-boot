package com.entfrm.biz.quartz.util;


import cn.hutool.core.util.StrUtil;
import com.entfrm.biz.quartz.entity.Job;
import com.entfrm.biz.quartz.entity.JobLog;
import com.entfrm.biz.quartz.enums.JobTypeQuartzEnum;
import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import com.entfrm.biz.quartz.event.JobLogEvent;
import com.entfrm.biz.quartz.exception.TaskException;
import com.entfrm.biz.quartz.service.JobService;
import com.entfrm.core.base.util.SpringContextUtil;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.annotation.Aspect;
import org.quartz.Trigger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;

import java.time.ZoneId;
import java.util.Date;

/**
 * 定时任务反射工具类
 *
 * @date 2019-06-28
 */
@Slf4j
@Aspect
@RequiredArgsConstructor
public class TaskInvokUtil {
	private final ApplicationEventPublisher publisher;

	@Autowired
	private JobService jobService;

	@SneakyThrows
	public void invokMethod(Job job, Trigger trigger) {

		ITaskInvok iTaskInvok;
		//执行开始时间
		long startTime;
		//执行结束时间
		long endTime;
		//获取执行开始时间
		startTime = System.currentTimeMillis();
		//更新定时任务表内的状态、执行时间、上次执行时间、下次执行时间等信息
		Job updateJob = new Job();
		updateJob.setId(job.getId());
		//日志
		JobLog jobLog = new JobLog();
		jobLog.setJobId(job.getId());
		jobLog.setJobName(job.getJobName());
		jobLog.setJobGroup(job.getJobGroup());
		jobLog.setJobOrder(job.getJobOrder());
		jobLog.setJobType(job.getJobType());
		jobLog.setExecutePath(job.getExecutePath());
		jobLog.setParamsValue(job.getParamsValue());
		jobLog.setCronExpression(job.getCronExpression());
		try {
			if (StrUtil.isEmpty(job.getJobType())) {
				log.info("定时任务类型无对应反射方式，反射类型为空");
				throw new TaskException("定时任务类型无对应反射方式，反射类型为空");
			}
			if (StrUtil.isNotEmpty(job.getJobType()) && JobTypeQuartzEnum.JAVA.getType()
					.equals(job.getJobType())) {
				iTaskInvok = SpringContextUtil.getBean("javaClassTaskInvok");
				iTaskInvok.invokMethod(job);
			} else if (StrUtil.isNotEmpty(job.getJobType()) && JobTypeQuartzEnum.SPRING_BEAN.getType()
					.equals(job.getJobType())) {
				iTaskInvok = SpringContextUtil.getBean("springBeanTaskInvok");
				iTaskInvok.invokMethod(job);
			} else if (StrUtil.isNotEmpty(job.getJobType()) && JobTypeQuartzEnum.REST.getType()
					.equals(job.getJobType())) {
				iTaskInvok = SpringContextUtil.getBean("restTaskInvok");
				iTaskInvok.invokMethod(job);
			} else if (StrUtil.isNotEmpty(job.getJobType()) && JobTypeQuartzEnum.JAR.getType()
					.equals(job.getJobType())) {
				iTaskInvok = SpringContextUtil.getBean("jarTaskInvok");
				iTaskInvok.invokMethod(job);
			} else {
				log.info("定时任务类型无对应反射方式，反射类型:{}", job.getJobType());
				throw new TaskException("");
			}
			//获取执行结束时间
			endTime = System.currentTimeMillis();
			jobLog.setJobMessage(EntfrmQuartzEnum.JOB_LOG_STATUS_SUCCESS.getDescription());
			jobLog.setJobLogStatus(EntfrmQuartzEnum.JOB_LOG_STATUS_SUCCESS.getType());
			jobLog.setExecuteTime(String.valueOf(endTime - startTime));
			//任务表信息更新
			updateJob.setJobExecuteStatus(EntfrmQuartzEnum.JOB_LOG_STATUS_SUCCESS.getType());
			updateJob.setStartTime(trigger.getStartTime());
			updateJob.setPreviousTime(trigger.getPreviousFireTime());
			updateJob.setNextTime(trigger.getNextFireTime());
		} catch (Throwable e) {
			//获取执行结束时间
			endTime = System.currentTimeMillis();
			log.error("定时任务执行失败，任务名称：{}；任务组名：{}，cron执行表达式：{}，执行时间：{}", job.getJobName(), job.getJobGroup(), job.getCronExpression(), new Date());
			jobLog.setJobMessage(EntfrmQuartzEnum.JOB_LOG_STATUS_FAIL.getDescription());
			jobLog.setJobLogStatus(EntfrmQuartzEnum.JOB_LOG_STATUS_FAIL.getType());
			jobLog.setExecuteTime(String.valueOf(endTime - startTime));
			jobLog.setExceptionInfo(StrUtil.sub(e.getMessage(), 0, 2000));
			//任务表信息更新
			updateJob.setJobExecuteStatus(EntfrmQuartzEnum.JOB_LOG_STATUS_FAIL.getType());
			updateJob.setStartTime(trigger.getStartTime());
			updateJob.setPreviousTime(trigger.getPreviousFireTime());
			updateJob.setNextTime(trigger.getNextFireTime());
		} finally {
			publisher.publishEvent(new JobLogEvent(jobLog));
			jobService.updateById(updateJob);
		}
	}
}
