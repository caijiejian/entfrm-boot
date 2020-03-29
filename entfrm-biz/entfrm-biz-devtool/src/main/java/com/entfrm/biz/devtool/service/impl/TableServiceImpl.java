package com.entfrm.biz.devtool.service.impl;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.entfrm.biz.devtool.config.GenConfig;
import com.entfrm.biz.devtool.entity.Column;
import com.entfrm.biz.devtool.entity.Table;
import com.entfrm.biz.devtool.mapper.TableMapper;
import com.entfrm.biz.devtool.service.ColumnService;
import com.entfrm.biz.devtool.service.TableService;
import com.entfrm.biz.devtool.util.GenUtil;
import com.entfrm.biz.devtool.util.VelocityInitializer;
import com.entfrm.biz.devtool.util.VelocityUtil;
import com.entfrm.core.base.constant.CommonConstants;
import com.entfrm.core.base.constant.GenConstants;
import com.entfrm.core.security.util.SecurityUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import static com.entfrm.biz.devtool.util.GenUtil.*;

/**
 * 业务 服务层实现
 */
@Slf4j
@Service
@AllArgsConstructor
public class TableServiceImpl extends ServiceImpl<TableMapper, Table> implements TableService {

    private final ColumnService columnService;

    /**
     * 生成表、列数据
     *
     * @param tableName 表名
     */
    @Override
    @Transactional
    public Map<String, Object> getGenTable(String tableName, String tableComment) {
        Map<String, Object> map = new HashMap<String, Object>();
        Table table1 = baseMapper.selectOne(new QueryWrapper<Table>().eq("table_name", tableName));
        if (table1 != null) {
            map.put("table", table1);
            List<Column> list = columnService.list(new QueryWrapper<Column>().eq(!StrUtil.isBlankIfStr(table1.getId()), "table_id", table1.getId()).orderByAsc("sort"));
            map.put("columns", list);
        } else {
            //表信息新增
            Table table = new Table();
            table.setTableName(tableName);
            table.setTableComment(tableComment);
            if ("true".equals(GenConfig.getAutoRemovePre()) && StrUtil.isNotBlank(GenConfig.getTablePrefix())) {
                table.setClassName(StrUtil.upperFirst(StrUtil.toCamelCase(StrUtil.replace(table.getTableName(), GenConfig.getTablePrefix(), ""))));
            } else {
                table.setClassName(StrUtil.upperFirst(StrUtil.toCamelCase(table.getTableName())));
            }
            table.setPackageName(GenConfig.getPackageName());
            table.setModuleName(getModuleName(GenConfig.getPackageName()));
            table.setBusinessName(StrUtil.lowerFirst(table.getClassName()));
            table.setFunctionName(replaceText(table.getTableComment()));
            table.setFunctionAuthor(GenConfig.getAuthor());
            table.setCreateBy(SecurityUtil.getUser().getUsername());
            baseMapper.insert(table);
            map.put("table", table);
            //表列 信息新增
            List<Column> columns = columnService.selectDbColumnsByName(tableName);
            List<Column> list = new ArrayList<>();
            for (Column column : columns) {
                String dataType = getDbType(column.getColumnType());
                String columnName = column.getColumnName();
                column.setTableId(table.getId());
                column.setCreateBy(table.getCreateBy());
                // 设置java字段名
                column.setJavaField(StrUtil.toCamelCase(columnName));

                if (arraysContains(GenConstants.COLUMNTYPE_STR, dataType)) {
                    column.setJavaType(GenConstants.TYPE_STRING);
                    // 字符串长度超过500设置为文本域
                    Integer columnLength = getColumnLength(column.getColumnType());
                    String htmlType = columnLength >= 255 ? GenConstants.HTML_TEXTAREA : GenConstants.HTML_INPUT;
                    column.setHtmlType(htmlType);
                } else if (arraysContains(GenConstants.COLUMNTYPE_TIME, dataType)) {
                    column.setJavaType(GenConstants.TYPE_DATE);
                    column.setHtmlType(GenConstants.HTML_DATETIME);
                } else if (arraysContains(GenConstants.COLUMNTYPE_NUMBER, dataType)) {
                    column.setHtmlType(GenConstants.HTML_INPUT);

                    // 如果是浮点型
                    String[] str = StrUtil.split(StrUtil.subBetween(column.getColumnType(), "(", ")"), ",");
                    if (str != null && str.length == 2 && Integer.parseInt(str[1]) > 0) {
                        column.setJavaType(GenConstants.TYPE_DOUBLE);
                    }
                    // 如果是整形
                    else if (str != null && str.length == 1 && Integer.parseInt(str[0]) <= 11) {
                        column.setJavaType(GenConstants.TYPE_INTEGER);
                    }
                    // 长整形
                    else {
                        column.setJavaType(GenConstants.TYPE_LONG);
                    }
                }

                // 插入字段
                if (!arraysContains(GenConstants.COLUMNNAME_NOT_EDIT, columnName) && !StrUtil.equals("1", column.getIsPk())) {
                    column.setIsAdd(GenConstants.REQUIRE);
                }

                // 编辑字段
                if (!arraysContains(GenConstants.COLUMNNAME_NOT_EDIT, columnName) && !StrUtil.equals("1", column.getIsPk())) {
                    column.setIsEdit(GenConstants.REQUIRE);
                }
                // 列表字段
                if (!arraysContains(GenConstants.COLUMNNAME_NOT_LIST, columnName) && !StrUtil.equals("1", column.getIsPk())) {
                    column.setIsList(GenConstants.REQUIRE);
                }
                // 查询字段
                if (!arraysContains(GenConstants.COLUMNNAME_NOT_QUERY, columnName) && !StrUtil.equals("1", column.getIsPk())) {
                    column.setIsQuery(GenConstants.REQUIRE);
                }

                // 查询字段类型
                if (StrUtil.endWithIgnoreCase(columnName, "name")) {
                    column.setQueryType(GenConstants.QUERY_LIKE);
                }

                if (StrUtil.endWithIgnoreCase(columnName, "createTime")) {
                    column.setQueryType(GenConstants.QUERY_BETWEEN);
                }

                // 状态字段设置单选框
                if (StrUtil.endWithIgnoreCase(columnName, "status")) {
                    column.setHtmlType(GenConstants.HTML_RADIO);
                }
                // 类型&性别字段设置下拉框
                else if (StrUtil.endWithIgnoreCase(columnName, "type")
                        || StrUtil.endWithIgnoreCase(columnName, "sex")) {
                    column.setHtmlType(GenConstants.HTML_SELECT);
                }
                columnService.save(column);
                list.add(column);
            }
            map.put("columns", list);
        }
        return map;
    }

    /**
     * 修改保存参数校验
     *
     * @param table 业务信息
     */
    public void validateEdit(Table table) {
        if (GenConstants.TPL_TREE.equals(table.getTplCategory())) {
            /*String options = JSONUtil.toJsonStr(table.getParams());
            JSONObject paramsObj = JSONUtil.parseObj(options);
            if (StrUtil.isEmpty(paramsObj.getStr(GenConstants.TREE_CODE))) {
                throw new BaseException("树编码字段不能为空");
            } else if (StrUtil.isEmpty(paramsObj.getStr(GenConstants.TREE_PARENT_CODE))) {
                throw new BaseException("树父编码字段不能为空");
            } else if (StrUtil.isEmpty(paramsObj.getStr(GenConstants.TREE_NAME))) {
                throw new BaseException("树名称字段不能为空");
            }*/
        }
    }

    /**
     * 修改业务
     *
     * @param table 业务信息
     * @return 结果
     */
    @Override
    @Transactional
    public void updateTable(Table table) {
        /*String options = JSONUtil.toJsonStr(table.getParams());
        table.setOptions(options);*/
        int row = baseMapper.updateById(table);
        if (row > 0) {
            for (Column column : table.getColumns()) {
                columnService.updateById(column);
            }
        }
    }


    @Override
    public List<Table> selectDbTableList(Table table) {
        return baseMapper.selectDbTableList(table);
    }

    /**
     * 查询业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    @Override
    public Table selectTableById(Integer id) {
        Table table = baseMapper.selectTableById(id);
        setTableFromOptions(table);
        return table;
    }

    /**
     * 查询据库列表
     *
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    public List<Table> selectDbTableListByNames(String[] tableNames) {
        return baseMapper.selectDbTableListByNames(tableNames);
    }


    /**
     * 删除业务对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    @Transactional
    public void deleteTableByIds(String ids) {
        baseMapper.deleteBatchIds(Arrays.asList(ids.split(",")));
        columnService.deleteColumnByTableIds(ids);
    }

    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     * @param operName  操作人员
     */
    @Override
    @Transactional
    public void importTable(List<Table> tableList, String operName) {
        for (Table table : tableList) {
            try {
                String tableName = table.getTableName();
                GenUtil.initTable(table, operName);
                int row = baseMapper.insert(table);
                if (row > 0) {
                    // 保存列信息

                }
            } catch (Exception e) {
                log.error("表名 " + table.getTableName() + " 导入失败：", e);
            }
        }
    }

    /**
     * 导入表结构
     *
     * @param table    导入表列表
     * @param operName 操作人员
     */
    @Override
    @Transactional
    public Table importTable(Table table, String operName) {
        try {
            String tableName = table.getTableName();
            GenUtil.initTable(table, operName);
            int row = baseMapper.insert(table);
            if (row > 0) {
                // 保存列信息
                List<Column> columns = columnService.selectDbColumnsByName(tableName);
                for (Column column : columns) {
                    GenUtil.initColumnField(column, table);
                    columnService.save(column);
                }
            }
        } catch (Exception e) {
            log.error("表名 " + table.getTableName() + " 导入失败：", e);
        }
        return table;
    }

    /**
     * 预览代码
     *
     * @param tableId 表编号
     * @return 预览数据列表
     */
    public Map<String, String> previewCode(Integer tableId) {
        Map<String, String> dataMap = new LinkedHashMap<>();
        // 查询表信息
        Table table = baseMapper.selectTableById(tableId);
        // 查询列信息
        List<Column> columns = JSONUtil.toList(JSONUtil.parseArray(table.getColumns()), Column.class);
        setPkColumn(table, columns);
        VelocityInitializer.initVelocity();

        VelocityContext context = VelocityUtil.prepareContext(table);

        // 获取模板列表
        List<String> templates = VelocityUtil.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, CommonConstants.UTF8);
            tpl.merge(context, sw);
            dataMap.put(template, sw.toString());
        }
        return dataMap;
    }

    /**
     * 生成代码
     *
     * @param tableName 表名称
     * @return 数据
     */
    @Override
    public byte[] generatorCode(String tableName) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        generatorCode(tableName, zip);
        IoUtil.close(zip);
        return outputStream.toByteArray();
    }

    /**
     * 批量生成代码
     *
     * @param tableNames 表数组
     * @return 数据
     */
    @Override
    public byte[] generatorCode(String[] tableNames) {
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ZipOutputStream zip = new ZipOutputStream(outputStream);
        for (String tableName : tableNames) {
            generatorCode(tableName, zip);
        }
        IoUtil.close(zip);
        return outputStream.toByteArray();
    }

    /**
     * 查询表信息并生成代码
     */
    private void generatorCode(String tableName, ZipOutputStream zip) {
        // 查询表信息
        Table table = baseMapper.selectOne(new QueryWrapper<Table>().eq("table_name", tableName));
        // 查询列信息
        List<Column> columns = columnService.list(new QueryWrapper<Column>().eq("table_id", table.getId()));
        setPkColumn(table, columns);
        table.setColumns(columns);

        VelocityInitializer.initVelocity();

        VelocityContext context = VelocityUtil.prepareContext(table);

        // 获取模板列表
        List<String> templates = VelocityUtil.getTemplateList(table.getTplCategory());
        for (String template : templates) {
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate(template, CommonConstants.UTF8);
            tpl.merge(context, sw);
            try {
                // 添加到zip
                zip.putNextEntry(new ZipEntry(VelocityUtil.getFileName(template, table)));
                IoUtil.write(zip, CommonConstants.UTF8, false, sw.toString());
                IoUtil.close(sw);
                zip.closeEntry();
            } catch (IOException e) {
                log.error("渲染模板失败，表名：" + table.getTableName(), e);
            }
        }
    }

    /**
     * 设置主键列信息
     *
     * @param table   业务表信息
     * @param columns 业务字段列表
     */
    public void setPkColumn(Table table, List<Column> columns) {
        for (Column column : columns) {
            if (StrUtil.equals("1", column.getIsPk())) {
                table.setPkColumn(column);
                break;
            }
        }
    }

    /**
     * 设置代码生成其他选项值
     *
     * @param table 设置后的生成对象
     */
    public void setTableFromOptions(Table table) {
        JSONObject paramsObj = JSONUtil.parseObj(table.getOptions());
        if (!StrUtil.isEmptyIfStr(paramsObj)) {
            String treeCode = paramsObj.getStr(GenConstants.TREE_CODE);
            String treeParentCode = paramsObj.getStr(GenConstants.TREE_PARENT_CODE);
            String treeName = paramsObj.getStr(GenConstants.TREE_NAME);
            table.setTreeCode(treeCode);
            table.setTreeParentCode(treeParentCode);
            table.setTreeName(treeName);
        }
    }

    /**
     * 查询表名称业务信息
     *
     * @param tableName 表名称
     * @return 业务信息
     */
    public Table selectTableByName(String tableName) {
        return baseMapper.selectTableByName(tableName);
    }
}
