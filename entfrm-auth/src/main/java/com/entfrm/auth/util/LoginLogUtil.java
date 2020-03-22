package com.entfrm.auth.util;

import cn.hutool.core.util.URLUtil;
import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.HttpUtil;
import com.entfrm.core.base.util.AddressUtil;
import com.entfrm.core.base.util.DateUtil;
import com.entfrm.core.base.util.StrUtil;
import lombok.experimental.UtilityClass;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import java.util.Objects;

/**
 * @author yong
 * @date 2020/3/19
 * @description 登录日志 util
 */
@UtilityClass
public class LoginLogUtil {

    public PreparedStatementSetter setLoginLog(HttpServletRequest request, String loginType, String userName, String errorMsg){
        String ip = ServletUtil.getClientIP(request);
        return new PreparedStatementSetter() {
            public void setValues(PreparedStatement ps) throws SQLException {
                ps.setString(1, userName);
                ps.setString(2, loginType);
                ps.setString(3, ip);
                ps.setString(4, AddressUtil.getCityInfo(ip));
                ps.setString(5, request.getHeader("user-agent"));
                if (StrUtil.isNotBlank(errorMsg)) {
                    ps.setString(6, "1");
                    ps.setString(7, errorMsg);
                } else {
                    ps.setString(6, "0");
                    ps.setString(7, "");
                }
                ps.setString(8, DateUtil.now());
            }
        };
    }

    public HttpServletRequest getRequest() {
        return ((ServletRequestAttributes) Objects.requireNonNull(RequestContextHolder.getRequestAttributes())).getRequest();
    }
}
