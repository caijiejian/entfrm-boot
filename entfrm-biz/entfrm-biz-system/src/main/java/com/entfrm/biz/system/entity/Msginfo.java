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
 * @date 2019-08-25 22:45:45
 *
 * @description 消息对象 Msginfo
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_msginfo")
public class Msginfo extends BaseEntity{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    @TableId
    private Integer id;

    /** 消息标题 */
    private String title;

    /** 消息类型 */
    private String type;

    /** 内容 */
    private String content;

    /** 附件 */
    private String files;

    /** 链接 */
    private String url;

    /** 机构ID */
    private Integer deptId;

    /** 扩展字段 */
    private String extend;



}
