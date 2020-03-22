package com.entfrm.core.security.exception;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * @author entfrm
 * @date 2018/7/8
 */
@JsonSerialize(using = EntfrmAuth2ExceptionSerializer.class)
public class InvalidException extends EntfrmAuth2Exception {

	public InvalidException(String msg, Throwable t) {
		super(msg);
	}

	@Override
	public String getOAuth2ErrorCode() {
		return "invalid_exception";
	}

	@Override
	public int getHttpErrorCode() {
		return 426;
	}

}
