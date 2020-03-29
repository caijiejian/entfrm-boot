package com.entfrm.core.data.constant;

/**
 * @author yong
 * @date 2020/2/1
 *
 * 数据源相关常量
 */
public interface DataSourceConstants {
	/**
	 * 查询数据源的SQL
	 */
	String DS_QUERY_SQL = "select * from sys_datasource where del_flag = 0";

	/**
	 * 动态路由KEY = 别名
	 */
	String DS_ALIAS = "id";

	/**
	 * 数据源名称
	 */
	String DS_NAME = "name";

	/**
	 * 数据驱动
	 */
	String DS_JDBC_DRIVER = "driver_class_name";

	/**
	 * jdbcurl
	 */
	String DS_JDBC_URL = "url";

	/**
	 * 用户名
	 */
	String DS_USER_NAME = "username";

	/**
	 * 密码
	 */
	String DS_USER_PWD = "password";

}
