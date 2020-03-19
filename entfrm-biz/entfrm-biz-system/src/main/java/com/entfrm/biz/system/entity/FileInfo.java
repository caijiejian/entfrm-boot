package com.entfrm.biz.system.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import com.entfrm.core.data.entity.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author entfrm
 * @date 2019-09-30 14:17:03
 *
 * @description 文件对象 FileInfo
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_file_info")
public class FileInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Integer id;

    /** 文件名称 */
    private String name;

    /** 类别 */
    private String category;

    /** 表名 */
    private String baseName;

    /** 对象编号 */
    private String objId;

    /** 文件类型 */
    private String type;

    /** 文件格式 */
    private String format;

    /** 文件大小 */
    private String size;

    /** 文件保存路径 */
    private String path;

    /** 缩略图路径 */
    private String thumbnail;

    /**
     * 机构ID
     */
    private Integer deptId;

    /** 状态 */
    private String status;

    /** 创建者 */
    protected String createBy;

    /** 创建时间 */
    protected Date createTime;

    /** 备注 */
    protected String remarks;

    @TableField(exist = false)
    private String pkField;
}
