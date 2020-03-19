package com.entfrm.auth.handler;

import com.entfrm.auth.util.LoginLogUtil;
import com.entfrm.core.base.constant.SqlConstants;
import com.entfrm.core.security.handler.AbstractAuthenticationFailureEvenHandler;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.task.TaskExecutor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.CompletableFuture;

/**
 * @author entfrm
 * @date 2019/10/8
 */
@Slf4j
@Component
@AllArgsConstructor
public class EntfrmAuthenticationFailureEvenHandler extends AbstractAuthenticationFailureEvenHandler {

	private final TaskExecutor taskExecutor;
	private final JdbcTemplate jdbcTemplate;
	/**
	 * 处理登录失败方法
	 * <p>
	 *
	 * @param authenticationException 登录的authentication 对象
	 * @param authentication          登录的authenticationException 对象
	 * @param request                 请求
	 * @param response                响应
	 */
	@Override
	public void handle(AuthenticationException authenticationException, Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
		log.info("用户：{} 登录失败，异常：{}", authentication.getPrincipal(), authenticationException.getLocalizedMessage());

		HttpServletRequest httpServletRequest = LoginLogUtil.getRequest();

		PreparedStatementSetter pss = LoginLogUtil.setLoginLog(httpServletRequest, authentication.getPrincipal().toString(),"登录失败，异常：" + authenticationException.getLocalizedMessage());

		CompletableFuture.runAsync(() -> {
			jdbcTemplate.update(SqlConstants.LOGIN_LOG, pss);
		}, taskExecutor);
	}
}
