package com.entfrm.biz.devtool.entity;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.entfrm.core.data.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.util.Map;

/**
 * 代码生成业务字段表 dev_column
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("dev_column")
public class Column extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    private Integer id;

    /**
     * 归属表编号
     */
    private Integer tableId;

    /**
     * 列名称
     */
    private String columnName;

    /**
     * 列描述
     */
    private String columnComment;

    /**
     * 列类型
     */
    private String columnType;

    /**
     * JAVA类型
     */
    private String javaType;

    /**
     * JAVA字段名
     */
    @NotBlank(message = "Java属性不能为空")
    private String javaField;

    /**
     * 是否主键（1是）
     */
    private String isPk;

    /**
     * 是否自增（1是）
     */
    private String isIncrement;

    /**
     * 是否必填（1是）
     */
    private String isRequired;

    /**
     * 是否为新增字段（1是）
     */
    private String isAdd;

    /**
     * 是否编辑字段（1是）
     */
    private String isEdit;

    /**
     * 是否列表字段（1是）
     */
    private String isList;

    /**
     * 是否查询字段（1是）
     */
    private String isQuery;

    /**
     * 查询方式（EQ等于、NE不等于、GT大于、LT小于、LIKE模糊、BETWEEN范围）
     */
    private String queryType;

    /**
     * 显示类型（input文本框、textarea文本域、select下拉框、checkbox复选框、radio单选框、datetime日期控件）
     */
    private String htmlType;

    /**
     * 字典类型
     */
    private String dictType;

    /**
     * 排序
     */
    private Integer sort;

    public boolean isSuperColumn() {
        return isSuperColumn(this.javaField);
    }

    public static boolean isSuperColumn(String javaField) {
        return StrUtil.equalsAnyIgnoreCase(javaField, "createBy", "createTime", "updateBy", "updateTime", "remarks", "delFlag");
    }

    public String convertExp() {
        String remarks = StrUtil.subBetween(this.columnComment, "（", "）");
        StringBuffer sb = new StringBuffer();
        if (StrUtil.isNotEmpty(remarks)) {
            for (String value : remarks.split(" ")) {
                if (StrUtil.isNotEmpty(value)) {
                    Object startStr = value.subSequence(0, 1);
                    String endStr = value.substring(1);
                    sb.append("").append(startStr).append("=").append(endStr).append(",");
                }
            }
            return sb.deleteCharAt(sb.length() - 1).toString();
        } else {
            return this.columnComment;
        }
    }
}
