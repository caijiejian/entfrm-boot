package com.entfrm.biz.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.entfrm.biz.system.entity.Dept;

import java.util.List;

/**
 * <p>
 * 部门表 Mapper 接口
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
public interface DeptMapper extends BaseMapper<Dept> {
    /**
     * 根据部门ID查询信息
     *
     * @param deptId 部门ID
     * @return 部门信息
     */
    public Dept selectDeptById(Integer deptId);

    /**
     * 根据角色ID查询部门
     *
     * @param roleId 角色ID
     * @return 部门列表
     */
    public List<String> selectRoleDeptTree(Integer roleId);

    public List<String> selectAreaDeptTree(Integer areaId);
}
