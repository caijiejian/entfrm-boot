package com.entfrm.biz.system.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.entfrm.core.data.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 用户信息表
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_user")
public class User extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @TableId
    private Integer id;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 密码
     */
    private String password;

    /**
     * 昵称
     */
    private String nickName;

    /**
     * 用户类型
     */
    private String type;

    /**
     * 手机号码
     */
    private String phone;

    /**
     * 用户性别（0男 1女 2未知）
     */
    private String sex;

    /**
     * 头像路径
     */
    private String avatar;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 机构ID
     */
    private Integer deptId;
    /**
     * 机构名称
     */
    private String deptName;

    /**
     * 最后登陆IP
     */
    private String loginIp;

    /**
     * 最后登陆时间
     */
    private Date loginTime;

    /**
     * 帐号状态（0正常 1停用）
     */
    private String status;

    /**
     * 角色名称集合
     */
    @TableField(exist = false)
    private String roleNames;

    /**
     * 角色集合
     */
    @TableField(exist = false)
    private Integer[] roles;

    /**
     * 角色集合字符
     */
    @TableField(exist = false)
    private String[] roleList;
    /**
     * 权限标识集合
     */
    @TableField(exist = false)
    private String[] permissions;

    @TableField(exist = false)
    private String newPassword;

    public boolean isAdmin() {
        return isAdmin(this.id);
    }

    public static boolean isAdmin(Integer id) {
        return id != null && 1 == id;
    }
}
