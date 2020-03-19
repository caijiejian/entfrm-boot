package com.entfrm.core.base.api;

import com.entfrm.core.base.util.MessageUtil;
import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 响应信息主体
 *
 * @param <T>
 * @author entfrm
 */
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class R<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 成功标记
     */
    private static Integer SUCCESS = 0;
    /**
     * 失败标记
     */
    private static Integer FAIL = 1;
    /**
     * 未认证
     */
    private static Integer UNAUTH = 401;

    @Getter
    @Setter
    private int code;

    @Getter
    @Setter
    private String msg;

    @Getter
    @Setter
    private long total; //element列表返回参数

    @Getter
    @Setter
    private T data;

    public static <T> R<T> ok() {
        return restResult(null, SUCCESS, MessageUtil.getText("success"));
    }

    public static <T> R<T> ok(String code, String... params) {
        return restResult(null, SUCCESS, MessageUtil.getText(code, params));
    }

    public static <T> R<T> ok(T data) {
        return restResult(data, SUCCESS, MessageUtil.getText("success"));
    }

    public static <T> R<T> ok(T data, String msg) {
        return restResult(data, SUCCESS, msg);
    }

    public static <T> R<T> ok(T data, long total) {
        return restData(data, SUCCESS, null, total);
    }

    public static <T> R<T> error() {
        return restResult(null, FAIL, MessageUtil.getText("fail"));
    }

    public static <T> R<T> error(String code, String... params) {
        return restResult(null, FAIL, MessageUtil.getText(code, params));
    }

    public static <T> R<T> error(String msg) {
        return restResult(null, FAIL, msg);
    }

    public static <T> R<T> error(T data) {
        return restResult(data, FAIL, null);
    }

    public static <T> R<T> error(T data, String msg) {
        return restResult(data, FAIL, msg);
    }

    public static <T> R<T> unAuth(String msg) {
        return restResult(null, UNAUTH, msg);
    }


    private static <T> R<T> restResult(T data, int code, String msg) {
        R<T> apiResult = new R<>();
        apiResult.setCode(code);
        apiResult.setData(data);
        apiResult.setMsg(msg);
        return apiResult;
    }

    private static <T> R<T> restData(T data, int code, String msg, long total) {
        R<T> apiData = new R<>();
        apiData.setCode(code);
        apiData.setMsg(msg);
        apiData.setTotal(total);
        apiData.setData(data);
        return apiData;
    }
}
