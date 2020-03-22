package com.entfrm.biz.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.entfrm.core.data.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 区域表 sys_area
 *
 * @author entfrm
 * @date 2019-05-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_area")
public class Area extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 编号 */
    @TableId
    private Integer id;

    /** 父区域编号 */
    private Integer parentId;

    /** 父区域名称 */
    @TableField(exist = false)
    private String parentName;
    /**
     * 所有父级编号
     */
    private String ancestors;
    /**
     * 区域名称
     */
    private String name;
    /**
     * 区域编码
     */
    private String code;
    /**
     * 显示顺序
     */
    private Integer sort;
    /**
     * 区域类型
     */
    private String type;

    /** 机构（数据权限） */
    @TableField(exist = false)
    private Integer[] deptIds;
}
