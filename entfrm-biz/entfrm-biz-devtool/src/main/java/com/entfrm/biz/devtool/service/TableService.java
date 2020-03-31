package com.entfrm.biz.devtool.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.entfrm.biz.devtool.entity.Table;

import java.util.List;
import java.util.Map;

/**
 * 业务 服务层
 */
public interface TableService extends IService<Table> {

    /**
     * 生成表、列数据
     *
     * @param tableName  表名
     */
    public Table getGenTable(String tableName, String tableComment);

    /**
     * 修改保存参数校验
     *
     * @param table 业务信息
     */
    public void validateEdit(Table table);

    /**
     * 修改业务
     *
     * @param table 业务信息
     * @return 结果
     */
    public void updateTable(Table table);

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
     * 查询业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    public Table selectTableById(Integer id);

    /**
     * 删除业务信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public void deleteTableByIds(String ids);

    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     * @param operName  操作人员
     */
    public void importTable(List<Table> tableList, String operName);

    /**
     * 导入表结构
     *
     * @param table 导入表列表
     * @param operName  操作人员
     */
    public Table importTable(Table table, String operName);

    /**
     * 预览代码
     *
     * @param tableId 表编号
     * @return 预览数据列表
     */
    public Map<String, String> previewCode(Integer tableId);

    /**
     * 生成代码
     *
     * @param tableName 表名称
     * @return 数据
     */
    public byte[] generatorCode(String tableName);

    /**
     * 批量生成代码
     *
     * @param tableNames 表数组
     * @return 数据
     */
    public byte[] generatorCode(String[] tableNames);

    /**
     * 查询表名称业务信息
     *
     * @param tableName 表名称
     * @return 业务信息
     */
    public Table selectTableByName(String tableName);

}
