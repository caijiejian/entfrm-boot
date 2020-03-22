package com.entfrm.biz.quartz.util;

import cn.hutool.core.util.StrUtil;
import com.entfrm.biz.quartz.entity.Job;
import com.entfrm.biz.quartz.exception.TaskException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 * 定时任务可执行jar反射实现
 *
 * @date 2019-06-28
 */
@Slf4j
@Component("jarTaskInvok")
public class JarTaskInvok implements ITaskInvok {

	@Override
	public void invokMethod(Job job) throws TaskException {
		ProcessBuilder processBuilder = new ProcessBuilder();
		File jar = new File(job.getExecutePath());
		processBuilder.directory(jar.getParentFile());
		List<String> commands = new ArrayList<>();
		commands.add("java");
		commands.add("-jar");
		commands.add(job.getExecutePath());
		if (StrUtil.isNotEmpty(job.getParamsValue())) {
			commands.add(job.getParamsValue());
		}
		processBuilder.command(commands);
		try {
			Process process = processBuilder.start();
		} catch (IOException e) {
			log.error("定时任务jar反射执行异常,执行任务：{}", job.getExecutePath());
			throw new TaskException("定时任务jar反射执行异常,执行任务：" + job.getExecutePath());
		}
	}
}
