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
 * @date 2019-10-13 20:06:20
 *
 * @description 消息模板对象 MsginfoTemplate
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_msginfo_template")
public class MsginfoTemplate extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /**  */
    private Integer id;

    /** 模板名称 */
    private String name;

    /** 模板类型 */
    private String type;

    /** 模板键值 */
    private String tplKey;

    /** 模板内容 */
    private String tplContent;

    /** 状态 */
    private String status;

}
