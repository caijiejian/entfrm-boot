package com.entfrm.biz.system.service.impl;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.system.entity.DictData;
import com.entfrm.biz.system.mapper.DictDataMapper;
import com.entfrm.biz.system.service.DictDataService;
import com.entfrm.core.base.config.EntfrmConfig;
import com.entfrm.core.base.util.StrUtil;
import lombok.AllArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 字典数据表 服务实现类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
@Service
@AllArgsConstructor
public class DictDataServiceImpl extends ServiceImpl<DictDataMapper, DictData> implements DictDataService {

    private final RedisTemplate redisTemplate;

    public List<DictData> getDictDataList(String dictType) {
        List<DictData> dictDataList = new ArrayList<>();
        //redis缓存
        if(Boolean.parseBoolean(EntfrmConfig.getRedisSwitch())){
            Object dicts = redisTemplate.opsForValue().get(dictType);
            if (!StrUtil.isEmptyIfStr(dicts)) {
                dictDataList = JSONUtil.toList(JSONUtil.parseArray(dicts.toString()), DictData.class);
            } else {
                dictDataList = baseMapper.selectList(new QueryWrapper<DictData>().eq("dict_type", dictType).orderByAsc("sort"));
                redisTemplate.opsForValue().set(dictType, JSONUtil.toJsonStr(dictDataList));
            }
        }else {
            dictDataList = baseMapper.selectList(new QueryWrapper<DictData>().eq("dict_type", dictType).orderByAsc("sort"));
        }
        return dictDataList;
    }
}
