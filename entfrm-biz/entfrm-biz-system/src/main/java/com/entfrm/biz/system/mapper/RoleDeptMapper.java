package com.entfrm.biz.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.entfrm.biz.system.entity.RoleDept;

/**
 * <p>
 * 角色和部门关联表 Mapper 接口
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
public interface RoleDeptMapper extends BaseMapper<RoleDept> {
    /**
     * 通过角色ID删除角色和部门关联
     *
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteRoleDeptByRoleId(Long roleId);
}
