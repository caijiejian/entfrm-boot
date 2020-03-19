package com.entfrm.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.system.entity.OperLog;
import com.entfrm.biz.system.service.OperLogService;
import com.entfrm.core.base.api.R;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * 系统操作记录
 *
 * @author entfrm
 */
@RestController
@AllArgsConstructor
@RequestMapping("/monitor/operLog")
public class OperLogController {

    private final OperLogService operLogService;

    private QueryWrapper<OperLog> getQueryWrapper(OperLog operLog) {
        return new QueryWrapper<OperLog>().like(StrUtil.isNotBlank(operLog.getOperName()), "oper_name", operLog.getOperName()).like(StrUtil.isNotBlank(operLog.getTitle()), "title", operLog.getTitle()).eq(!StrUtil.isEmptyIfStr(operLog.getStatus()), "status", operLog.getStatus())
                .between(StrUtil.isNotBlank(operLog.getBeginTime()) && StrUtil.isNotBlank(operLog.getEndTime()), "oper_time", operLog.getBeginTime(), operLog.getEndTime()).orderByDesc("id");
    }

    @PreAuthorize("@ps.hasPerm('operLog_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, OperLog operLog) {
        IPage<OperLog> operLogPage = operLogService.page(page, getQueryWrapper(operLog));
        return R.ok(operLogPage.getRecords(), operLogPage.getTotal());
    }

    @com.entfrm.core.log.annotation.OperLog("操作日志删除")
    @PreAuthorize("@ps.hasPerm('operLog_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable String id) {
        try {
            operLogService.removeById(id);
            return R.ok();
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
    }
}
