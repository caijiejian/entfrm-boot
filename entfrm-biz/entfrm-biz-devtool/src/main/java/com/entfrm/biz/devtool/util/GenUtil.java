package com.entfrm.biz.devtool.util;

import cn.hutool.core.util.StrUtil;
import com.entfrm.biz.devtool.config.GenConfig;
import com.entfrm.biz.devtool.entity.Column;
import com.entfrm.biz.devtool.entity.Table;
import com.entfrm.core.base.constant.GenConstants;

import java.util.Arrays;

/**
 * 代码生成器 工具类
 */
public class GenUtil {
    /**
     * 初始化表信息
     */
    public static void initTable(Table table, String operName) {
        if("true".equals(GenConfig.getAutoRemovePre()) && StrUtil.isNotBlank(GenConfig.getTablePrefix())){
            table.setClassName(StrUtil.upperFirst(StrUtil.toCamelCase(StrUtil.replace(table.getTableName(), GenConfig.getTablePrefix(), ""))));
        }else {
            table.setClassName(StrUtil.upperFirst(StrUtil.toCamelCase(table.getTableName())));
        }
        table.setPackageName(GenConfig.getPackageName());
        table.setModuleName(getModuleName(GenConfig.getPackageName()));
        table.setBusinessName(StrUtil.lowerFirst(table.getClassName()));
        table.setFunctionName(replaceText(table.getTableComment()));
        table.setFunctionAuthor(GenConfig.getAuthor());
        table.setCreateBy(operName);
    }

    /**
     * 初始化列属性字段
     */
    public static void initColumnField(Column column, Table table) {

    }

    /**
     * 校验数组是否包含指定值
     *
     * @param arr         数组
     * @param targetValue 值
     * @return 是否包含
     */
    public static boolean arraysContains(String[] arr, String targetValue) {
        return Arrays.asList(arr).contains(targetValue);
    }

    /**
     * 获取模块名
     *
     * @param packageName 包名
     * @return 模块名
     */
    public static String getModuleName(String packageName) {
        int lastIndex = packageName.lastIndexOf(".");
        int nameLength = packageName.length();
        String moduleName = StrUtil.sub(packageName, lastIndex + 1, nameLength);
        return moduleName;
    }

    /**
     * 关键字替换
     *
     * @param text 需要被替换的名字
     * @return 替换后的名字
     */
    public static String replaceText(String text) {
        return text.replaceAll("(?:表|tm)", "");
    }

    /**
     * 获取数据库类型字段
     *
     * @param columnType 列类型
     * @return 截取后的列类型
     */
    public static String getDbType(String columnType) {
        if (StrUtil.indexOf(columnType, '(') > 0) {
            return StrUtil.subBefore(columnType, "(", false);
        } else {
            return columnType;
        }
    }

    /**
     * 获取字段长度
     *
     * @param columnType 列类型
     * @return 截取后的列类型
     */
    public static Integer getColumnLength(String columnType) {
        if (StrUtil.indexOf(columnType, '(') > 0) {
            String length = StrUtil.subBetween(columnType, "(", ")");
            return Integer.valueOf(length);
        } else {
            return 0;
        }
    }
}
