package com.entfrm.biz.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.entfrm.biz.system.entity.Area;
import com.entfrm.biz.system.entity.Dept;
import com.entfrm.biz.system.entity.Role;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 部门表 服务类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
public interface DeptService extends IService<Dept> {

    /**
     * 构建树
     *
     * @param list     分类表
     * @param parentId 传入的父节点ID
     * @return String
     */
    public List<Dept> buildTree(List<Dept> list, int parentId);

    /**
     * 根据部门ID查询信息
     *
     * @param deptId 部门ID
     * @return 部门信息
     */
    public Dept selectDeptById(Integer deptId);


    public List<Map<String, Object>> areaDeptTreeData(Area area);
}
