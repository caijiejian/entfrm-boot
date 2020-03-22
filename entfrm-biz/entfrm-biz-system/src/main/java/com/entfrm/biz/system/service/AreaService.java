package com.entfrm.biz.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.entfrm.biz.system.entity.Area;

import java.util.List;
import java.util.Map;

/**
 * 区域 服务层
 *
 * @author entfrm
 * @date 2019-05-06
 */
public interface AreaService extends IService<Area> {
    /**
     * 根据区域ID查询信息
     *
     * @param areaId 区域ID
     * @return 区域信息
     */
    public Area selectAreaById(Integer areaId);

    /**
     * 查询区域管理树
     *
     * @param area 区域信息
     * @return 所有区域信息
     */
    public List<Map<String, Object>> selectAreaTree(Area area);

    /**
     * 根据机构编码查询信息
     *
     * @param deptCode 机构编码
     * @return 区域信息
     */
    public Area selectAreaByCode(String deptCode);
}
