package com.entfrm.core.base.util;

import java.lang.management.ManagementFactory;
import java.util.Date;

/**
 * @author yong
 * @date 2019/8/21
 * @description 时间 util
 */
public class DateUtil extends cn.hutool.core.date.DateUtil {

    /**
     * 获取服务器启动时间
     */
    public static Date getServerStartDate() {
        long time = ManagementFactory.getRuntimeMXBean().getStartTime();
        return new Date(time);
    }

    public static String formatDate(long dateTime, String pattern) {
        return format(new Date(dateTime), pattern);
    }

}
