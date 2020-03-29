package com.entfrm.biz.quartz.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.quartz.entity.Job;
import com.entfrm.biz.quartz.entity.JobLog;
import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import com.entfrm.biz.quartz.service.JobLogService;
import com.entfrm.core.base.api.R;
import com.entfrm.core.log.annotation.OperLog;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 定时任务执行日志表
 *
 * @author yong
 * @date 2019-06-28
 */
@RestController
@AllArgsConstructor
@RequestMapping("/quartz/jobLog")
public class JobLogController {
    private final JobLogService jobLogService;

    /**
     * 分页查询
     *
     * @param page      分页对象
     * @param jobLog 定时任务执行日志表
     * @return
     */
    @GetMapping("/list")
    public R list(Page page, JobLog jobLog) {
        IPage<JobLog> jobLogPage = jobLogService.page(page, Wrappers.query(jobLog));
        return R.ok(jobLogPage.getRecords(), jobLogPage.getTotal());
    }

    /**
     * 通过id删除定时任务
     *
     * @param id id
     * @return R
     */
    @OperLog("定时任务日志删除")
    @DeleteMapping("/{id}")
    @PreAuthorize("@ps.hasPerm('jobLog_del')")
    public R removeById(@PathVariable Integer id) {
        jobLogService.removeById(id);
        return R.ok();
    }
}
