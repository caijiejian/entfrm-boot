package com.entfrm.biz.devtool.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.entfrm.core.data.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import java.util.List;
import java.util.Map;

/**
 * @author entfrm
 * @date 2019/8/9
 * @description 业务表信息
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("dev_table")
public class Table extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId
    private Integer id;

    /**
     * 表名称
     */
    @NotBlank(message = "表名称不能为空")
    private String tableName;

    /**
     * 表描述
     */
    @NotBlank(message = "表描述不能为空")
    private String tableComment;

    /**
     * 实体类名称(首字母大写)
     */
    @NotBlank(message = "实体类名称不能为空")
    private String className;

    /**
     * 使用的模板（crud单表操作 tree树表操作）
     */
    private String tplCategory;

    /**
     * 生成包路径
     */
    @NotBlank(message = "生成包路径不能为空")
    private String packageName;

    /**
     * 生成模块名
     */
    @NotBlank(message = "生成模块名不能为空")
    private String moduleName;

    /**
     * 生成业务名
     */
    @NotBlank(message = "生成业务名不能为空")
    private String businessName;

    /**
     * 生成功能名
     */
    @NotBlank(message = "生成功能名不能为空")
    private String functionName;

    /**
     * 生成作者
     */
    @NotBlank(message = "作者不能为空")
    private String functionAuthor;

    /**
     * 主键信息
     */
    @TableField(exist = false)
    private Column pkColumn;

    /**
     * 其它生成选项
     */
    private String options;

    /**
     * 树编码字段
     */
    @TableField(exist = false)
    private String treeId;

    /**
     * 树父编码字段
     */
    @TableField(exist = false)
    private String treeParentId;

    /**
     * 树名称字段
     */
    @TableField(exist = false)
    private String treeName;

    /**
     * 表列信息
     */
    @TableField(exist = false)
    private List<Column> columns;

    /**
     * 其他参数
     */
    @TableField(exist = false)
    private Map<String, Object> params;
}
