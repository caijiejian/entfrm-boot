package com.entfrm.biz.quartz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.quartz.entity.JobLog;
import com.entfrm.biz.quartz.mapper.JobLogMapper;
import com.entfrm.biz.quartz.service.JobLogService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


/**
 * 定时任务执行日志表
 *
 * @author entfrm
 * @date 2019-06-28
 */
@Service
@AllArgsConstructor
public class JobLogServiceImpl extends ServiceImpl<JobLogMapper, JobLog> implements JobLogService {

}
