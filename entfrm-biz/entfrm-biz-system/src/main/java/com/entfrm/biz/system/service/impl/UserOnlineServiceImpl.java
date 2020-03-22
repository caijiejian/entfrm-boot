package com.entfrm.biz.system.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.system.entity.UserOnline;
import com.entfrm.biz.system.mapper.UserOnlineMapper;
import com.entfrm.biz.system.service.UserOnlineService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 在线用户记录 服务实现类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
@Service
public class UserOnlineServiceImpl extends ServiceImpl<UserOnlineMapper, UserOnline> implements UserOnlineService {

    /**
     * 保存会话信息
     *
     * @param online 会话信息
     */
    @Override
    public void saveOnline(UserOnline online) {
        baseMapper.saveOnline(online);
    }

    @Override
    public List<UserOnline> selectOnlineByExpired(Date expiredDate) {
        String lastAccessTime = DateUtil.formatDateTime(expiredDate);
        List<UserOnline> userOnlineList = baseMapper.selectList(new QueryWrapper<UserOnline>().le("last_access_time", lastAccessTime));
        return userOnlineList;
    }
}
