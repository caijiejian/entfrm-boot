package com.entfrm.biz.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.entfrm.biz.system.mapper.BackupMapper;
import com.entfrm.biz.system.entity.Backup;
import com.entfrm.biz.system.service.BackupService;

/**
 * @author entfrm
 * @date 2020-03-02 16:33:24
 *
 * @description 备份Service业务层
 */
@Service
public class BackupServiceImpl extends ServiceImpl<BackupMapper, Backup> implements BackupService {

}
