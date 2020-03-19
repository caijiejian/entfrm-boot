package com.entfrm.auth.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * @author yong
 * @date 2020/2/10
 * @description 用户信息
 */
@Data
public class SysUser implements Serializable {
    /**
     * 主键ID
     */
    private Integer id;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 昵称
     */
    private String nickName;
    /**
     * 密码
     */
    private String password;
    /**
     * 机构编号
     */
    private Integer deptId;
    /**
     * 状态
     */
    private String status;

    public boolean isAdmin() {
        return isAdmin(this.id);
    }

    public static boolean isAdmin(Integer id) {
        return id != null && 1 == id;
    }
}
