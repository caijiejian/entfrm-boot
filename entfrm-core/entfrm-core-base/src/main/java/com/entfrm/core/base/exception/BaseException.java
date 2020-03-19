package com.entfrm.core.base.exception;

import cn.hutool.core.util.StrUtil;
import com.entfrm.core.base.util.MessageUtil;

/**
 * @description 自定义异常
 */
public class BaseException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    /**
     * 错误码
     */
    private String code = "500";

    /**
     * 错误消息
     */
    private String msg;

    /**
     * 错误码对应的参数
     */
    private String[] params;


    public BaseException(String code, String msg, String[] params) {
        this.code = code;
        this.msg = msg;
        this.params = params;
    }

    public BaseException(String code, String[] params) {
        this(code, null, params);
    }

    public BaseException(String msg) {
        this(null, msg, null);
    }

    @Override
    public String getMessage() {
        String message = null;
        if (StrUtil.isNotEmpty(code)) {
            message = MessageUtil.getText(code, params);
        }
        if (message == null) {
            message = msg;
        }
        return message;
    }

    public String getCode() {
        return code;
    }

    public Object[] getParams() {
        return params;
    }

    public String setMessage() {
        return msg;
    }
}
