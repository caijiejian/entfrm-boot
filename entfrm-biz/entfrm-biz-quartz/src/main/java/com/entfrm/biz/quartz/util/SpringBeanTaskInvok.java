package com.entfrm.biz.quartz.util;

import cn.hutool.core.util.StrUtil;
import com.entfrm.biz.quartz.entity.Job;
import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import com.entfrm.biz.quartz.exception.TaskException;
import com.entfrm.core.base.util.SpringContextUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;


/**
 * 定时任务spring bean反射实现
 *
 * @date 2019-06-28
 */
@Component("springBeanTaskInvok")
@Slf4j
public class SpringBeanTaskInvok implements ITaskInvok {
	@Override
	public void invokMethod(Job job) throws TaskException {
		Object target = null;
		Method method = null;
		Object returnValue = null;

		String className = job.getExecutePath().substring(0, job.getExecutePath().lastIndexOf("."));
		String methodName = job.getExecutePath().substring(job.getExecutePath().lastIndexOf(".") + 1);

		//通过Spring上下文去找 也有可能找不到
		target = SpringContextUtil.getBean(className);
		try {
			if (StrUtil.isNotEmpty(job.getParamsValue())) {
				method = target.getClass().getDeclaredMethod(methodName, String.class);
				ReflectionUtils.makeAccessible(method);
				returnValue = method.invoke(target, job.getParamsValue());
			} else {
				method = target.getClass().getDeclaredMethod(methodName);
				ReflectionUtils.makeAccessible(method);
				returnValue = method.invoke(target);
			}
			if (StrUtil.isEmpty(returnValue.toString()) || EntfrmQuartzEnum.JOB_LOG_STATUS_FAIL.getType()
					.equals(returnValue.toString())) {
				log.error("定时任务springBeanTaskInvok异常,执行任务：{}", className);
				throw new TaskException("定时任务springBeanTaskInvok业务执行失败,任务：" + className);
			}
		} catch (NoSuchMethodException e) {
			log.error("定时任务spring bean反射异常方法未找到,执行任务：{}", className);
			throw new TaskException("定时任务spring bean反射异常方法未找到,执行任务：" + className);
		} catch (IllegalAccessException e) {
			log.error("定时任务spring bean反射异常,执行任务：{}", className);
			throw new TaskException("定时任务spring bean反射异常,执行任务：" + className);
		} catch (InvocationTargetException e) {
			log.error("定时任务spring bean反射执行异常,执行任务：{}", className);
			throw new TaskException("定时任务spring bean反射执行异常,执行任务：" + className);
		}
	}
}
