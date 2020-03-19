package com.entfrm.core.security.service;

import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.springframework.util.PatternMatchUtils;
import org.springframework.util.StringUtils;

import java.util.Collection;
import java.util.Set;

/**
 * 接口权限判断工具
 *
 * @author yong
 * @date 2018/6/22
 */
@Slf4j
@Component("ps")
public class PermissionService {
    /**
     * 判断接口是否有xxx_xxx权限
     *
     * @param permission 权限
     * @return {boolean}
     */
    public boolean hasPerm(String permission) {
        if (StrUtil.isBlank(permission)) {
            return false;
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null) {
            return false;
        }

        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        return authorities.stream()
                .map(GrantedAuthority::getAuthority)
                .filter(StringUtils::hasText)
                .anyMatch(x -> PatternMatchUtils.simpleMatch(permission, x) || PatternMatchUtils.simpleMatch("*_*", x));
    }

    /**
     * 验证用户是否具有以下任意一个权限
     *
     * @param permissions 以 ,为分隔符的权限列表
     * @return 用户是否具有以下任意一个权限
     */
    public boolean hasAnyPerm(String permissions) {
        if (StringUtils.isEmpty(permissions)) {
            return false;
        }
        for (String permission : permissions.split(",")) {
            if (permission != null && hasPerm(permission)) {
                return true;
            }
        }
        return false;
    }
}
