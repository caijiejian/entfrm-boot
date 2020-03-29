package com.entfrm.biz.quartz.util;

import com.entfrm.biz.quartz.config.EntfrmQuartzFactory;
import com.entfrm.biz.quartz.entity.Job;
import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import lombok.extern.slf4j.Slf4j;
import org.quartz.*;
import org.springframework.stereotype.Component;

/**
 * 定时任务的工具类
 *
 * @date 2019-06-28
 */
@Slf4j
@Component
public class TaskUtil {

    /**
     * 获取定时任务的唯一key
     *
     * @param job
     * @return
     */
    public JobKey getJobKey(Job job) {
        return JobKey.jobKey(job.getJobName(), job.getJobGroup());
    }

    /**
     * 获取定时任务触发器cron的唯一key
     *
     * @param job
     * @return
     */
    public TriggerKey getTriggerKey(Job job) {
        return TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());
    }

    /**
     * 添加或更新定时任务
     *
     * @param job
     * @param scheduler
     */
    public void addOrUpateJob(Job job, Scheduler scheduler) {
        CronTrigger trigger = null;
        try {
            JobKey jobKey = this.getJobKey(job);
            //获得触发器
            TriggerKey triggerKey = this.getTriggerKey(job);
            trigger = (CronTrigger) scheduler.getTrigger(triggerKey);
            //判断触发器是否存在（如果存在说明之前运行过但是在当前被禁用了，如果不存在说明一次都没运行过）
            if (trigger == null) {
                //新建一个工作任务 指定任务类型为串接进行的
                JobDetail jobDetail = JobBuilder.newJob(EntfrmQuartzFactory.class).withIdentity(jobKey).build();
                //将任务信息添加到任务信息中
                jobDetail.getJobDataMap().put(EntfrmQuartzEnum.SCHEDULE_JOB_KEY.getType(), job);
                //将cron表达式进行转换
                CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
                cronScheduleBuilder = this.handleCronScheduleMisfirePolicy(job, cronScheduleBuilder);
                //创建触发器并将cron表达式对象给塞入
                trigger = TriggerBuilder.newTrigger().withIdentity(triggerKey).withSchedule(cronScheduleBuilder).build();
                //在调度器中将触发器和任务进行组合
                scheduler.scheduleJob(jobDetail, trigger);
            } else {
                CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());
                cronScheduleBuilder = this.handleCronScheduleMisfirePolicy(job, cronScheduleBuilder);
                //按照新的规则进行
                trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(cronScheduleBuilder).build();
                //将任务信息更新到任务信息中
                trigger.getJobDataMap().put(EntfrmQuartzEnum.SCHEDULE_JOB_KEY.getType(), job);
                //重启
                scheduler.rescheduleJob(triggerKey, trigger);
            }
            // 如任务状态为暂停
            if (job.getJobStatus().equals(EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType())) {
                this.pauseJob(job, scheduler);
            }
        } catch (SchedulerException e) {
            log.error("添加或更新定时任务，失败信息：{}", e.getMessage());
        }
    }

    /**
     * 立即执行定时任务一次
     *
     * @param job
     * @param scheduler
     */
    public void runJob(Job job, Scheduler scheduler) {
        try {
            if (scheduler != null) {
                scheduler.triggerJob(getJobKey(job));
            }
        } catch (SchedulerException e) {
            log.error("执行任务失败，失败信息：{}", e.getMessage());
        }
    }
    /**
     * 暂停定时任务
     *
     * @param job
     * @param scheduler
     */
    public void pauseJob(Job job, Scheduler scheduler) {
        try {
            if (scheduler != null) {
                scheduler.triggerJob(getJobKey(job));
            }
        } catch (SchedulerException e) {
            log.error("暂停任务失败，失败信息：{}", e.getMessage());
        }

    }

    /**
     * 恢复定时任务
     *
     * @param job
     * @param scheduler
     */
    public void resumeJob(Job job, Scheduler scheduler) {
        try {
            if (scheduler != null) {
                scheduler.resumeJob(getJobKey(job));
            }
        } catch (SchedulerException e) {
            log.error("恢复任务失败，失败信息：{}", e.getMessage());
        }

    }

    /**
     * 移除定时任务
     *
     * @param job
     * @param scheduler
     */
    public void removeJob(Job job, Scheduler scheduler) {
        try {
            if (scheduler != null) {
                // 停止触发器
                scheduler.pauseTrigger(getTriggerKey(job));
                //移除触发器
                scheduler.unscheduleJob(getTriggerKey(job));
                //删除任务
                scheduler.deleteJob(getJobKey(job));
            }
        } catch (Exception e) {
            log.error("移除定时任务失败，失败信息：{}", e.getMessage());
        }
    }

    /**
     * 启动所有运行定时任务
     *
     * @param scheduler
     */
    public void startJobs(Scheduler scheduler) {
        try {
            if (scheduler != null) {
                scheduler.resumeAll();
            }
        } catch (SchedulerException e) {
            log.error("启动所有运行定时任务失败，失败信息：{}", e.getMessage());
        }
    }

    /**
     * 停止所有运行定时任务
     *
     * @param scheduler
     */
    public void pauseJobs(Scheduler scheduler) {
        try {
            if (scheduler != null) {
                scheduler.pauseAll();
            }
        } catch (Exception e) {
            log.error("暂停所有运行定时任务失败，失败信息：{}", e.getMessage());
        }
    }

    /**
     * 获取错失执行策略方法
     *
     * @param job
     * @param cronScheduleBuilder
     * @return
     */
    private CronScheduleBuilder handleCronScheduleMisfirePolicy(Job job, CronScheduleBuilder cronScheduleBuilder) {
        if (EntfrmQuartzEnum.MISFIRE_DEFAULT.getType().equals(job.getMisfirePolicy())) {
            return cronScheduleBuilder;
        } else if (EntfrmQuartzEnum.MISFIRE_IGNORE_MISFIRES.getType().equals(job.getMisfirePolicy())) {
            return cronScheduleBuilder.withMisfireHandlingInstructionIgnoreMisfires();
        } else if (EntfrmQuartzEnum.MISFIRE_FIRE_AND_PROCEED.getType().equals(job.getMisfirePolicy())) {
            return cronScheduleBuilder.withMisfireHandlingInstructionFireAndProceed();
        } else if (EntfrmQuartzEnum.MISFIRE_DO_NOTHING.getType().equals(job.getMisfirePolicy())) {
            return cronScheduleBuilder.withMisfireHandlingInstructionDoNothing();
        } else {
            return cronScheduleBuilder;
        }
    }

    /**
     * 判断cron表达式是否正确
     *
     * @param cronExpression
     * @return
     */
    public boolean isValidCron(String cronExpression) {
        return CronExpression.isValidExpression(cronExpression);
    }
}
