package com.entfrm.biz.system.entity;

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
 * @date 2019-08-25 22:46:40
 *
 * @description 消息推送对象 MsginfoPush
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_msginfo_push")
public class MsginfoPush implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 编号 */
    @TableId
    private Integer id;

    /** 消息标题 */
    @TableField(exist = false)
    private String title;

    /** 消息类型 */
    @TableField(exist = false)
    private String type;

    /** 内容 */
    @TableField(exist = false)
    private String content;

    /** 消息编号 */
    private Integer msginfoId;

    /** 接受人 */
    private String receiveId;

    /** 是否阅读 */
    private String isRead;

    /** 创建时间 */
    private Date createTime;

    /** 阅读时间 */
    private Date readTime;


}
