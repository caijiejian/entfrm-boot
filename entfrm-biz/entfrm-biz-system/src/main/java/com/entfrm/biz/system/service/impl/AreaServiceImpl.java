package com.entfrm.biz.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.system.entity.Area;
import com.entfrm.biz.system.entity.Dept;
import com.entfrm.biz.system.mapper.AreaMapper;
import com.entfrm.biz.system.service.AreaService;
import com.entfrm.biz.system.service.DeptService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 区域 服务层实现
 *
 * @author entfrm
 * @date 2019-05-06
 */
@Service
@AllArgsConstructor
public class AreaServiceImpl extends ServiceImpl<AreaMapper, Area> implements AreaService {

    private final DeptService deptService;

    /**
     * 根据区域ID查询信息
     *
     * @param areaId 区域ID
     * @return 区域信息
     */
    @Override
    public Area selectAreaById(Integer areaId) {
        return baseMapper.selectAreaById(areaId);
    }

    /**
     * 根据机构编码查询信息
     *
     * @param deptCode 机构编码
     * @return 区域信息
     */
    public Area selectAreaByCode(String deptCode){
        return baseMapper.selectAreaByCode(deptCode);
    }

    /**
     * 查询区域管理树
     *
     * @param area 区域信息
     * @return 所有区域信息
     */
    @Override
    public List<Map<String, Object>> selectAreaTree(Area area) {
        List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
        List<Area> areaList = baseMapper.selectList(new QueryWrapper<Area>().like(StrUtil.isNotBlank(area.getName()), "name", area.getName()));
        trees = getTrees(areaList, false);
        return trees;
    }

    /**
     * 对象转区域树
     *
     * @param areaList 区域列表
     * @param isCheck  是否需要选中
     * @return
     */
    public List<Map<String, Object>> getTrees(List<Area> areaList, boolean isCheck) {

        List<Map<String, Object>> trees = new ArrayList<Map<String, Object>>();
        for (Area area : areaList) {
            Map<String, Object> areaMap = new HashMap<String, Object>();
            areaMap.put("id", area.getId());
            areaMap.put("pId", area.getParentId());
            areaMap.put("name", area.getName());
            areaMap.put("title", area.getName());
//            if (isCheck) {
//                areaMap.put("checked", roleAreaList.contains(area.getAreaId() + area.getName()));
//            } else {
//                areaMap.put("checked", false);
//            }
            trees.add(areaMap);
        }
        return trees;
    }
}
