package com.entfrm.core.security.exception;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import lombok.SneakyThrows;

/**
 * @author entfrm
 * @date 2019/11/16
 * <p>
 * OAuth2 异常格式化
 */
public class EntfrmAuth2ExceptionSerializer extends StdSerializer<EntfrmAuth2Exception> {
	public EntfrmAuth2ExceptionSerializer() {
		super(EntfrmAuth2Exception.class);
	}

	@Override
	@SneakyThrows
	public void serialize(EntfrmAuth2Exception value, JsonGenerator gen, SerializerProvider provider) {
		gen.writeStartObject();
		gen.writeObjectField("code", "1");
		gen.writeStringField("msg", value.getMessage());
		gen.writeStringField("data", value.getErrorCode());
		gen.writeEndObject();
	}
}
