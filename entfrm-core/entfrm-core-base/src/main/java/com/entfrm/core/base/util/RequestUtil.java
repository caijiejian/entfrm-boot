package com.entfrm.core.base.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @author yong
 * @date 2020/3/27
 * @description Request 类
 */
public class RequestUtil {

    public static String getDomain(HttpServletRequest request) {
        StringBuffer url = request.getRequestURL();
        String contextPath = request.getServletContext().getContextPath();
        return url.delete(url.length() - request.getRequestURI().length(), url.length()).append(contextPath).toString();
    }

}
