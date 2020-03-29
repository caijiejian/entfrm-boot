package com.entfrm.biz.devtool.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.entfrm.biz.devtool.entity.Table;

import java.util.List;


/**
 * <p>
 * 用户信息表 Mapper 接口
 * </p>
 *
 * @author tumengtech
 * @since 2019-01-30
 */
public interface TableMapper extends BaseMapper<Table> {
    /**
     * 查询据库列表
     *
     * @param table 业务信息
     * @return 数据库表集合
     */
    public List<Table> selectDbTableList(Table table);
    /**
     * 查询据库列表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    public List<Table> selectDbTableListByNames(String[] tableNames);

    /**
     * 查询表ID业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    public Table selectTableById(Integer id);
    /**
     * 查询数据库表名称业务信息
     *
     * @param tableName 表名称
     * @return 业务信息
     */
    public Table selectDbTableByName(String tableName);


    /**
     * 查询表名称业务信息
     *
     * @param tableName 表名称
     * @return 业务信息
     */
    public Table selectTableByName(String tableName);
}
