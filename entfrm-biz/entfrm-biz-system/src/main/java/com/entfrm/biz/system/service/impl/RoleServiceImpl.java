package com.entfrm.biz.system.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.system.entity.Dept;
import com.entfrm.biz.system.entity.Role;
import com.entfrm.biz.system.entity.RoleDept;
import com.entfrm.biz.system.entity.RoleMenu;
import com.entfrm.biz.system.mapper.RoleMapper;
import com.entfrm.biz.system.service.DeptService;
import com.entfrm.biz.system.service.RoleDeptService;
import com.entfrm.biz.system.service.RoleMenuService;
import com.entfrm.biz.system.service.RoleService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * <p>
 * 角色信息表 服务实现类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
@Service
@AllArgsConstructor
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    private final RoleDeptService roleDeptService;
    private final RoleMenuService roleMenuService;
    private final DeptService deptService;

    /**
     * 根据用户ID查询权限
     *
     * @param userId 用户ID
     * @return 权限列表
     */
    @Override
    public Set<String> selectRoleKeys(Integer userId) {
        List<Role> perms = baseMapper.selectRolesByUserId(userId);
        Set<String> permsSet = new HashSet<>();
        for (Role perm : perms) {
            if (perm != null) {
                permsSet.addAll(Arrays.asList(perm.getCode().trim().split(",")));
            }
        }
        return permsSet;
    }

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    @Override
    public List<Role> selectMyRolesByUserId(Integer userId) {
        return baseMapper.selectRolesByUserId(userId);
    }

    /**
     * 根据用户ID查询角色
     *
     * @param userId 用户ID
     * @return 角色列表
     */
    @Override
    public List<Role> selectRolesByUserId(Integer userId) {
        List<Role> roles = baseMapper.selectList(new QueryWrapper<>());
        if (StrUtil.isEmptyIfStr(userId)) {
            return roles;
        } else {
            List<Role> userRoles = baseMapper.selectRolesByUserId(userId);
            for (Role role : roles) {
                for (Role userRole : userRoles) {
                    if (role.getId() == userRole.getId()) {
                        role.setFlag(true);
                        break;
                    }
                }
            }
            return roles;
        }
    }

    /**
     * 新增保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    @Transactional
    public boolean insertRole(Role role) {
        // 新增角色信息
        baseMapper.insert(role);
        return insertRoleMenu(role);
    }

    /**
     * 修改数据权限信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public boolean updatePerms(Role role) {
        // 修改角色信息
        baseMapper.updateById(role);
        // 删除角色与部门关联
        roleDeptService.remove(new QueryWrapper<RoleDept>().eq("role_id", role.getId()));
        // 新增角色和部门信息（数据权限）
        return insertRoleDept(role);
    }

    /**
     * 新增角色部门信息(数据权限)
     *
     * @param role 角色对象
     */
    public boolean insertRoleDept(Role role) {
        boolean rows = true;
        // 新增角色与部门（数据权限）管理
        List<RoleDept> list = new ArrayList<RoleDept>();
        for (Integer deptId : role.getDeptIds()) {
            Dept dept = deptService.getById(deptId);
            if (dept != null) {
                RoleDept rd = new RoleDept();
                rd.setRoleId(role.getId());
                rd.setDeptId(deptId);
                list.add(rd);
            }
        }
        if (list.size() > 0) {
            rows = roleDeptService.saveBatch(list);
        }
        return rows;
    }


    /**
     * 修改保存角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public boolean updateRoleMenu(Role role) {
        // 删除角色与菜单关联
        roleMenuService.remove(new QueryWrapper<RoleMenu>().eq("role_id", role.getId()));
        return insertRoleMenu(role);
    }

    /**
     * 新增角色菜单信息
     *
     * @param role 角色对象
     */
    public boolean insertRoleMenu(Role role) {
        boolean rows = true;
        // 新增用户与角色管理
        List<RoleMenu> list = new ArrayList<RoleMenu>();
        for (Integer menuId : role.getMenuIds()) {
            RoleMenu rm = new RoleMenu();
            rm.setRoleId(role.getId());
            rm.setMenuId(menuId);
            list.add(rm);
        }
        if (list.size() > 0) {
            rows = roleMenuService.saveBatch(list);
        }
        return rows;
    }
}
