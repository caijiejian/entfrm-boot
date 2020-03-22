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
 * @date 2019-09-07 13:55:39
 *
 * @description 序列对象 Serial
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_serial")
public class Serial implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 编号 */
    @TableId
    private Integer id;

    /** 分类 */
    private String classify;

    /** 当前序号 */
    private Integer serialNo;

    protected Date updateTime;
}
