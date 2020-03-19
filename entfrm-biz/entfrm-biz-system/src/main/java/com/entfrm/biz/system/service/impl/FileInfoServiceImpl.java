package com.entfrm.biz.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.entfrm.biz.system.mapper.FileInfoMapper;
import com.entfrm.biz.system.entity.FileInfo;
import com.entfrm.biz.system.service.FileInfoService;

/**
 * @author entfrm
 * @date 2019-09-30 14:17:03
 *
 * @description 文件Service业务层
 */
@Service
public class FileInfoServiceImpl extends ServiceImpl<FileInfoMapper, FileInfo> implements FileInfoService {

}
