package com.entfrm.auth.service;

import com.entfrm.auth.entity.SysUser;
import com.entfrm.core.base.constant.CommonConstants;
import com.entfrm.core.base.constant.SqlConstants;
import com.entfrm.core.base.util.StrUtil;
import com.entfrm.core.security.entity.EntfrmUser;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author yong
 * @date 2020/2/10
 * @description 用户详情实现
 */
@Configuration
@AllArgsConstructor
public class EntfrmUserDetailService implements UserDetailsService {

    private final JdbcTemplate jdbcTemplate;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<SysUser> userList = jdbcTemplate.query(SqlConstants.QUERY_USER, new Object[]{username}, new BeanPropertyRowMapper(SysUser.class));
        if (userList != null && userList.size() > 0) {
            SysUser sysUser = userList.get(0);
            Set<String> permissions = new HashSet<>();
            //角色 菜单权限
            List<String> urList = jdbcTemplate.query(SqlConstants.QUERY_ROLES, new Object[]{sysUser.getId().toString()}, new RowMapper<String>() {
                public String mapRow(ResultSet rs, int rowNum)
                        throws SQLException {
                    return rs.getString(1);
                }
            });
            if(urList != null && urList.size() > 0){
                permissions.addAll(urList.stream().map(roleId -> CommonConstants.ROLE + roleId).collect(Collectors.toList()));
                urList.forEach(roleId -> {
                    List<String> pList = jdbcTemplate.query(SqlConstants.QUERY_PREMS, new Object[]{roleId.toString()}, new RowMapper<String>() {
                        @Override
                        public String mapRow(ResultSet rs, int i)
                                throws SQLException {
                            return rs.getString(1);
                        }
                    });
                    if(pList != null && pList.size() > 0 && StrUtil.isNotBlank(pList.get(0))){
                        permissions.addAll(pList);
                    }
                });
            }
            boolean notLocked = false;
            if ("0".equals(sysUser.getStatus())) {
                notLocked = true;
            }
            EntfrmUser authUser = new EntfrmUser(sysUser.getId(), sysUser.getDeptId(), sysUser.getUserName(), sysUser.getPassword(), true, true, true, notLocked,
                    AuthorityUtils.createAuthorityList(permissions.toArray(new String[0])));

            BeanUtils.copyProperties(sysUser, authUser);
            return authUser;
        } else {
            throw new UsernameNotFoundException("");
        }
    }
}

