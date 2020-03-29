package com.entfrm.core.data.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author yong
 * @date 2020/3/24
 * @description 数据类型
 */
@Getter
@AllArgsConstructor
public enum DataTypeEnum {
    /**
     * mysql
     */
    MYSQL("mysql", "com.mysql.cj.jdbc.Driver"),

    /**
     * sqlserver
     */
    SQLSERVER("sqlserver", "com.microsoft.sqlserver.jdbc.SQLServerDriver"),

    /**
     * oracle
     */
    ORACLE("oracle", "oracle.jdbc.driver.OracleDriver"),

    /**
     * Postgresql
     */
    POSTGRESQL("postgresql", "org.postgresql.Driver"),

    /**
     * sqlite
     */
    SQLITE("sqlite", "org.sqlite.JDBC");

    /**
     * 类型
     */
    private final String type;

    /**
     * 驱动
     */
    private final String driverClassName;

}
