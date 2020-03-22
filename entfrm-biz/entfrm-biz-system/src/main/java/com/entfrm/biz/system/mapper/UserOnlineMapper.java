package com.entfrm.biz.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.entfrm.biz.system.entity.UserOnline;

/**
 * <p>
 * 在线用户记录 Mapper 接口
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
public interface UserOnlineMapper extends BaseMapper<UserOnline> {
    /**
     * 保存会话信息
     *
     * @param online 会话信息
     * @return 结果
     */
    public int saveOnline(UserOnline online);
}
