package com.entfrm.biz.quartz.util;

import cn.hutool.core.util.StrUtil;
import com.entfrm.biz.quartz.entity.Job;
import com.entfrm.biz.quartz.enums.EntfrmQuartzEnum;
import com.entfrm.biz.quartz.exception.TaskException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 定时任务java class反射实现
 *
 * @date 2019-06-28
 */
@Component("javaClassTaskInvok")
@Slf4j
public class JavaClassTaskInvok implements ITaskInvok {
    @Override
    public void invokMethod(Job job) throws TaskException {
        Object obj = null;
        Class clazz = null;
        Method method = null;
        Object returnValue = null;

        String className = job.getExecutePath().substring(0, job.getExecutePath().lastIndexOf("."));
        String methodName = job.getExecutePath().substring(job.getExecutePath().lastIndexOf(".") + 1);
        try {

            if (StrUtil.isNotEmpty(job.getParamsValue())) {
                clazz = Class.forName(className);
                obj = clazz.newInstance();
                method = clazz.getDeclaredMethod(methodName, String.class);
                returnValue = method.invoke(obj, job.getParamsValue());
            } else {
                clazz = Class.forName(className);
                obj = clazz.newInstance();
                method = clazz.getDeclaredMethod(methodName);
                returnValue = method.invoke(obj);
            }
            if (StrUtil.isEmpty(returnValue.toString()) || EntfrmQuartzEnum.JOB_LOG_STATUS_FAIL.getType().equals(returnValue.toString())) {
                log.error("定时任务javaClassTaskInvok异常,执行任务：{}", className);
                throw new TaskException("定时任务javaClassTaskInvok业务执行失败,任务：" + className);
            }
        } catch (ClassNotFoundException e) {
            log.error("定时任务java反射类没有找到,执行任务：{}", className);
            throw new TaskException("定时任务java反射类没有找到,执行任务：" + className);
        } catch (IllegalAccessException e) {
            log.error("定时任务java反射类异常,执行任务：{}", className);
            throw new TaskException("定时任务java反射类异常,执行任务：" + className);
        } catch (InstantiationException e) {
            log.error("定时任务java反射类异常,执行任务：{}", className);
            throw new TaskException("定时任务java反射类异常,执行任务：" + className);
        } catch (NoSuchMethodException e) {
            log.error("定时任务java反射执行方法名异常,执行任务：{}", className);
            throw new TaskException("定时任务java反射执行方法名异常,执行任务：" + className);
        } catch (InvocationTargetException e) {
            log.error("定时任务java反射执行异常,执行任务：{}", className);
            throw new TaskException("定时任务java反射执行异常,执行任务：" + className);
        }

    }
}
