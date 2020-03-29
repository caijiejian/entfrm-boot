package com.entfrm.biz.quartz.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.quartz.entity.Job;
import com.entfrm.biz.quartz.entity.JobLog;
import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import com.entfrm.biz.quartz.service.JobLogService;
import com.entfrm.biz.quartz.service.JobService;
import com.entfrm.biz.quartz.util.TaskUtil;
import com.entfrm.core.base.api.R;
import com.entfrm.core.log.annotation.OperLog;
import com.entfrm.core.security.util.SecurityUtil;
import lombok.AllArgsConstructor;
import org.quartz.Scheduler;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 定时任务管理
 *
 * @author entfrm
 * @date 2019-06-28
 */
@RestController
@AllArgsConstructor
@RequestMapping("/quartz/job")
public class JobController {
    private final JobService jobService;
    private final JobLogService jobLogService;
    private final TaskUtil taskUtil;
    private final Scheduler scheduler;

    /**
     * 定时任务分页查询
     *
     * @param page 分页对象
     * @param job  定时任务调度表
     * @return
     */
    @GetMapping("/list")
    public R list(Page page, Job job) {
        IPage<Job> jobPage = jobService.page(page, Wrappers.query(job));
        return R.ok(jobPage.getRecords(), jobPage.getTotal());
    }


    /**
     * 通过id查询定时任务
     *
     * @param id id
     * @return R
     */
    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(jobService.getById(id));
    }

    /**
     * 新增定时任务
     *
     * @param job 定时任务调度表
     * @return R
     */
    @OperLog("定时任务新增")
    @PostMapping
    @PreAuthorize("@ps.hasPerm('job_add')")
    public R save(@RequestBody Job job) {
        job.setJobStatus(EntfrmQuartzEnum.JOB_STATUS_RELEASE.getType());
        return R.ok(jobService.save(job));
    }

    /**
     * 修改定时任务
     *
     * @param job 定时任务调度表
     * @return R
     */
    @OperLog("定时任务修改")
    @PutMapping
    @PreAuthorize("@ps.hasPerm('job_edit')")
    public R updateById(@RequestBody Job job) {
        Job queryJob = this.jobService.getById(job.getId());
        if (EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType().equals(queryJob.getJobStatus())) {
            this.taskUtil.addOrUpateJob(job, scheduler);
            jobService.updateById(job);
        } else if (EntfrmQuartzEnum.JOB_STATUS_RELEASE.getType().equals(queryJob.getJobStatus())) {
            jobService.updateById(job);
        }
        return R.ok();
    }

    /**
     * 定时任务状态修改
     */
    @OperLog("定时任务状态更改")
    @PreAuthorize("@ss.hasPermi('job_changeStatus')")
    @PutMapping("/changeStatus")
    public R changeStatus(@RequestBody Job job) {
        Job newJob = jobService.getById(job.getId());
        if (newJob != null) {
            if (EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType().equals(job.getJobStatus())) {
                this.taskUtil.addOrUpateJob(job, scheduler);
                jobService.updateById(job);
            } else if (EntfrmQuartzEnum.JOB_STATUS_RELEASE.getType().equals(job.getJobStatus())) {
                jobService.updateById(job);
            }
        }
        return R.ok();
    }

    /**
     * 通过id删除定时任务
     *
     * @param id id
     * @return R
     */
    @OperLog("删除定时任务")
    @DeleteMapping("/{id}")
    @PreAuthorize("@ps.hasPerm('job_del')")
    public R removeById(@PathVariable Integer id) {
        Job queryJob = this.jobService.getById(id);
        if (EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType().equals(queryJob.getJobStatus())) {
            this.taskUtil.removeJob(queryJob, scheduler);
            this.jobService.removeById(id);
        } else if (EntfrmQuartzEnum.JOB_STATUS_RELEASE.getType().equals(queryJob.getJobStatus())) {
            this.jobService.removeById(id);
        }
        return R.ok();
    }

    /**
     * 立即执行定时任务一次
     */
    @OperLog("执行定时任务一次")
    @PutMapping("/runJob")
    @PreAuthorize("@ps.hasPerm('job_start')")
    public R runJob(@RequestBody Job job) {
        taskUtil.runJob(job, scheduler);
        return R.ok();
    }

    /**
     * 暂停全部定时任务
     *
     * @return
     */
    @OperLog("暂停全部定时任务")
    @PostMapping("/stopJobs")
    @PreAuthorize("@ps.hasPerm('job_stop')")
    public R stopJobs() {
        taskUtil.pauseJobs(scheduler);
        int count = this.jobService.count(new LambdaQueryWrapper<Job>()
                .eq(Job::getJobStatus, EntfrmQuartzEnum.JOB_STATUS_RUNNING.getType()));
        if (count <= 0) {
            return R.ok("无正在运行定时任务");
        } else {
            //更新定时任务状态条件，运行状态2更新为暂停状态2
            this.jobService.update(Job.builder()
                    .jobStatus(EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType()).build(), new UpdateWrapper<Job>()
                    .lambda().eq(Job::getJobStatus, EntfrmQuartzEnum.JOB_STATUS_RUNNING.getType()));
            return R.ok("暂停成功");
        }
    }

    /**
     * 启动全部定时任务
     *
     * @return
     */
    @OperLog("启动全部定时任务")
    @PostMapping("/startJobs")
    @PreAuthorize("@ps.hasPerm('job_start')")
    public R startJobs() {
        //更新定时任务状态条件，暂停状态3更新为运行状态2
        this.jobService.update(Job.builder().jobStatus(EntfrmQuartzEnum.JOB_STATUS_RUNNING
                .getType()).build(), new UpdateWrapper<Job>().lambda()
                .eq(Job::getJobStatus, EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType()));
        taskUtil.startJobs(scheduler);
        return R.ok();
    }

    /**
     * 刷新全部定时任务
     *
     * @return
     */
    @OperLog("刷新全部定时任务")
    @PostMapping("/refreshJobs")
    @PreAuthorize("@ps.hasPerm('job_refresh')")
    public R refreshJobs() {
        jobService.list().forEach((job) -> {
            if (EntfrmQuartzEnum.JOB_STATUS_RELEASE.getType().equals(job.getJobStatus())
                    || EntfrmQuartzEnum.JOB_STATUS_DEL.getType().equals(job.getJobStatus())) {
                taskUtil.removeJob(job, scheduler);
            } else if (EntfrmQuartzEnum.JOB_STATUS_RUNNING.getType().equals(job.getJobStatus())
                    || EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType().equals(job.getJobStatus())) {
                taskUtil.addOrUpateJob(job, scheduler);
            } else {
                taskUtil.removeJob(job, scheduler);
            }
        });
        return R.ok();
    }

    /**
     * 启动定时任务
     *
     * @param jobId
     * @return
     */
    @OperLog("启动定时任务")
    @PostMapping("/startJob/{id}")
    @PreAuthorize("@ps.hasPerm('job_start')")
    public R startJob(@PathVariable("id") Integer jobId) {
        Job queryJob = this.jobService.getById(jobId);
        if (queryJob != null && EntfrmQuartzEnum.JOB_LOG_STATUS_FAIL.getType()
                .equals(queryJob.getJobStatus())) {
            taskUtil.addOrUpateJob(queryJob, scheduler);
        } else {
            taskUtil.resumeJob(queryJob, scheduler);
        }
        //更新定时任务状态条件，暂停状态3更新为运行状态2
        this.jobService.updateById(Job.builder().id(jobId)
                .jobStatus(EntfrmQuartzEnum.JOB_STATUS_RUNNING.getType()).build());
        return R.ok();
    }

    /**
     * 暂停定时任务
     *
     * @return
     */
    @OperLog("暂停定时任务")
    @PostMapping("/stopJob/{id}")
    @PreAuthorize("@ps.hasPerm('job_stop')")
    public R shutdownJob(@PathVariable("id") Integer id) {
        Job queryJob = this.jobService.getById(id);
        //更新定时任务状态条件，运行状态2更新为暂停状态3
        this.jobService.updateById(Job.builder().id(queryJob.getId())
                .jobStatus(EntfrmQuartzEnum.JOB_STATUS_NOT_RUNNING.getType()).build());
        taskUtil.pauseJob(queryJob, scheduler);
        return R.ok();
    }

    /**
     * 查询定时执行日志
     *
     * @return
     */
    @GetMapping("/jobLog")
    public R getJobLog(Page page, JobLog jobLog) {
        return R.ok(jobLogService.page(page, Wrappers.query(jobLog)));
    }

    /**
     * 检验任务名称和任务组联合是否唯一
     *
     * @return
     */
    @GetMapping("/isValidName")
    public R isValidTaskName(@RequestParam String jobName, @RequestParam String jobGroup) {
        return this.jobService
                .count(Wrappers.query(Job.builder().jobName(jobName).jobGroup(jobGroup).build())) > 0
                ? R.error() : R.ok();
    }
}
