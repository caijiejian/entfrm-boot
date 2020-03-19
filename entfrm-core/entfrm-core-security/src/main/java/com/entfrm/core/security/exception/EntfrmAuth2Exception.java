package com.entfrm.core.security.exception;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Getter;
import org.springframework.security.oauth2.common.exceptions.OAuth2Exception;

/**
 * @author entfrm
 * @date 2019/7/8
 * 自定义OAuth2Exception
 */
@JsonSerialize(using = EntfrmAuth2ExceptionSerializer.class)
public class EntfrmAuth2Exception extends OAuth2Exception {
	@Getter
	private String errorCode;

	public EntfrmAuth2Exception(String msg) {
		super(msg);
	}

	public EntfrmAuth2Exception(String msg, String errorCode) {
		super(msg);
		this.errorCode = errorCode;
	}
}
