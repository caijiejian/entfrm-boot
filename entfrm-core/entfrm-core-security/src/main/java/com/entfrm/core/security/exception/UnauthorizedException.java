package com.entfrm.core.security.exception;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.springframework.http.HttpStatus;

/**
 * @author entfrm
 * @date 2018/7/8
 */
@JsonSerialize(using = EntfrmAuth2ExceptionSerializer.class)
public class UnauthorizedException extends EntfrmAuth2Exception {

	public UnauthorizedException(String msg, Throwable t) {
		super(msg);
	}

	@Override
	public String getOAuth2ErrorCode() {
		return "unauthorized";
	}

	@Override
	public int getHttpErrorCode() {
		return HttpStatus.UNAUTHORIZED.value();
	}

}
