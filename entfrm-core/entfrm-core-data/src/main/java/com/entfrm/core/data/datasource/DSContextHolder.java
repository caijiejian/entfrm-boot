package com.entfrm.core.data.datasource;

import lombok.experimental.UtilityClass;

/**
 * @author yong
 * @date 2020/2/1
 *
 * 根据当前线程来选择具体的数据源
 */
@UtilityClass
public class DSContextHolder {
	private final ThreadLocal<Integer> contextHolder = new ThreadLocal<>();

	/**
	 * 提供给AOP去设置当前的线程的数据源的信息
	 *
	 * @param dataSourceType
	 */
	public void setDSType(Integer dataSourceType) {
		contextHolder.set(dataSourceType);
	}

	/**
	 * 提供给AbstractRoutingDataSource的实现类，通过key选择数据源
	 *
	 * @return
	 */
	public Integer getDSType() {
		return contextHolder.get();
	}

	/**
	 * 使用默认的数据源
	 *
	 */
	public void clearDSType() {
		contextHolder.remove();
	}
}
