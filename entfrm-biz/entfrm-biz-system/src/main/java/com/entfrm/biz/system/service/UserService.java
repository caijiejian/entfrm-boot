package com.entfrm.biz.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.entfrm.biz.system.entity.User;

import java.util.List;

/**
 * <p>
 * 用户信息表 服务类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
public interface UserService extends IService<User> {

    /**
     * 保存用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    public int saveUser(User user);

    /**
     * 导入用户数据
     *
     * @param userList        用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    public String importUser(List<User> userList, Boolean isUpdateSupport);

}
