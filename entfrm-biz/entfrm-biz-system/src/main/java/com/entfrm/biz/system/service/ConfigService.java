package com.entfrm.biz.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.entfrm.biz.system.entity.Config;

/**
 * <p>
 * 参数配置表 服务类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
public interface ConfigService extends IService<Config> {
    String getValueByKey(String key);
}
