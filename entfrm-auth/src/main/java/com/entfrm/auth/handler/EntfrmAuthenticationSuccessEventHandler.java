package com.entfrm.auth.handler;

import cn.hutool.core.util.URLUtil;
import com.entfrm.auth.util.LoginLogUtil;
import com.entfrm.core.base.constant.SecurityConstants;
import com.entfrm.core.base.constant.SqlConstants;
import com.entfrm.core.security.entity.EntfrmUser;
import com.entfrm.core.security.handler.AbstractAuthenticationSuccessEventHandler;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.task.TaskExecutor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.CompletableFuture;

/**
 * @author entfmr
 * @date 2019/10/8
 */
@Slf4j
@Component
@AllArgsConstructor
public class EntfrmAuthenticationSuccessEventHandler extends AbstractAuthenticationSuccessEventHandler {

	private final TaskExecutor taskExecutor;
	private final JdbcTemplate jdbcTemplate;

	/**
	 * 处理登录成功方法
	 * <p>
	 * 获取到登录的authentication 对象
	 *
	 * @param authentication 登录对象
	 * @param request        请求
	 * @param response       返回
	 */
	@Override
	public void handle(Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
		EntfrmUser entfrmUser = (EntfrmUser) authentication.getPrincipal();
		log.info("用户：{} 登录成功", entfrmUser);

		HttpServletRequest httpServletRequest = LoginLogUtil.getRequest();

		if(SecurityConstants.AUTH_TOKEN.equals(URLUtil.getPath(request.getRequestURI()))){
			PreparedStatementSetter pss = LoginLogUtil.setLoginLog(httpServletRequest, entfrmUser.getUsername(), "");
			CompletableFuture.runAsync(() -> {
				jdbcTemplate.update(SqlConstants.LOGIN_LOG, pss);
			}, taskExecutor);
		}
	}
}
