package com.entfrm.biz.devtool.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.entfrm.biz.devtool.entity.Column;

import java.util.List;

/**
 * 业务字段 服务层
 */
public interface ColumnService extends IService<Column> {

    /**
     * 根据表名称查询列信息
     *
     * @param tableName 表名称
     * @return 列信息
     */
    public List<Column> selectDbColumnsByName(String tableName);

    /**
     * 删除业务字段信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteColumnByTableIds(String ids);
}
