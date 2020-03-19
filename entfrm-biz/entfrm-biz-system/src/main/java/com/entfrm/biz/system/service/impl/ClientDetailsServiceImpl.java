package com.entfrm.biz.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.system.entity.ClientDetails;
import com.entfrm.biz.system.mapper.ClientDetailsMapper;
import com.entfrm.biz.system.service.ClientDetailsService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 授权客户端 服务实现类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
@Service
public class ClientDetailsServiceImpl extends ServiceImpl<ClientDetailsMapper, ClientDetails> implements ClientDetailsService {

}
