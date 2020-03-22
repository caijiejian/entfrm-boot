package com.entfrm.biz.system.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import com.entfrm.core.data.entity.BaseEntity;

/**
 * @author entfrm
 * @date 2019-08-25 22:56:58
 *
 * @description 快捷方式对象 Shortcut
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_shortcut")
public class Shortcut extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    @TableId
    private Integer id;

    /** 名称 */
    private String name;

    /** 区域 */
    private String region;

    /** 图标 */
    private String icon;

    /** 路径 */
    private String path;

    /** 顺序 */
    private Integer sort;

}
