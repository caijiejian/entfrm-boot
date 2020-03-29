package com.entfrm.biz.system.service.impl;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.SecureUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.system.entity.*;
import com.entfrm.biz.system.mapper.UserMapper;
import com.entfrm.biz.system.service.*;
import com.entfrm.core.base.exception.BaseException;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 用户信息表 服务实现类
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
@Service
@AllArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    private final ConfigService configService;
    private final UserRoleService userRoleService;
    private final DeptService deptService;
    private final PasswordEncoder passwordEncoder;

    @Override
    @Transactional
    public int saveUser(User user) {
        if (StrUtil.isEmptyIfStr(user.getId())) {
            // 新增用户信息
            int rows = baseMapper.insert(user);
            // 新增用户与角色管理
            addUserRole(user);
            return rows;
        } else {
            // 删除用户与角色关联
            userRoleService.remove(new QueryWrapper<UserRole>().eq("user_id", user.getId()));
            // 新增用户与角色管理
            addUserRole(user);
            return baseMapper.updateById(user);
        }
    }

    /**
     * 新增用户角色信息
     *
     * @param user 用户对象
     */
    public void addUserRole(User user) {
        Integer[] roles = user.getRoles();
        if (roles != null) {
            // 新增用户与角色管理
            for (Integer roleId : roles) {
                UserRole ur = new UserRole();
                ur.setUserId(user.getId());
                ur.setRoleId(roleId);
                userRoleService.save(ur);
            }
        }
    }

    /**
     * 导入用户数据
     *
     * @param userList        用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @return 结果
     */
    @Override
    public String importUser(List<User> userList, Boolean isUpdateSupport) {
        if (userList == null || userList.size() == 0) {
            throw new BaseException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        String password = configService.getValueByKey("user.initPassword");
        for (User user : userList) {
            try {
                // 验证是否存在这个用户
                User u = baseMapper.selectOne(new QueryWrapper<User>().eq("user_name", user.getUserName()));
                if (u == null) {
                    user.setPassword(passwordEncoder.encode(password));
                    if(StrUtil.isNotBlank(user.getDeptName())){
                        Dept dept = deptService.getOne(new QueryWrapper<Dept>().eq("name", user.getDeptName()));
                        if(dept != null){
                            user.setDeptId(dept.getId());
                            user.setDeptName(dept.getName());
                        }
                    }
                    baseMapper.insert(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 导入成功");
                } else if (isUpdateSupport) {
                    this.updateById(user);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 更新成功");
                } else {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、账号 " + user.getUserName() + " 已存在");
                }
            } catch (Exception e) {
                failureNum++;
                String msg = "<br/>" + failureNum + "、账号 " + user.getUserName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
            }
        }
        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new BaseException(failureMsg.toString());
        } else {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }

}
