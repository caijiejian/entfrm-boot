package com.entfrm.biz.quartz.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.quartz.entity.Job;
import com.entfrm.biz.quartz.mapper.JobMapper;
import com.entfrm.biz.quartz.service.JobService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 定时任务调度表
 *
 * @author entfrm
 * @date 2019-06-28
 */
@Service
@AllArgsConstructor
public class JobServiceImpl extends ServiceImpl<JobMapper, Job> implements JobService {

}
