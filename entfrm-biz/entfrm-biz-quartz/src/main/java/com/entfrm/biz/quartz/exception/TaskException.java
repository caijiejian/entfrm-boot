package com.entfrm.biz.quartz.exception;


/**
 * 定时任务异常
 *
 * @date 2019-06-28
 */
public class TaskException extends Exception {

    public TaskException() {
        super();
    }

    public TaskException(String msg) {
        super(msg);
    }
}
