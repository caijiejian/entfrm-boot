package com.entfrm.biz.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.entfrm.biz.system.entity.UserOnline;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 在线用户记录 服务类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
public interface UserOnlineService extends IService<UserOnline> {

    /**
     * 保存会话信息
     *
     * @param online 会话信息
     */
    public void saveOnline(UserOnline online);

    /**
     * 查询会话集合
     *
     * @param expiredDate 有效期
     * @return 会话集合
     */
    public List<UserOnline> selectOnlineByExpired(Date expiredDate);

}
