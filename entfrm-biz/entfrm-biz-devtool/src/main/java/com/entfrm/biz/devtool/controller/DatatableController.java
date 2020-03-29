package com.entfrm.biz.devtool.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.entfrm.biz.devtool.entity.Table;
import com.entfrm.biz.devtool.service.TableService;
import com.entfrm.core.base.api.R;
import com.entfrm.core.base.util.StrUtil;
import com.entfrm.core.data.datasource.DSContextHolder;
import com.entfrm.core.data.enums.DataTypeEnum;
import com.entfrm.core.data.util.AliasUtil;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author yong
 * @date 2020/3/21
 * @description 数据表管理
 */
@RestController
@RequestMapping("/devtool/datatable")
@AllArgsConstructor
public class DatatableController {

    private final JdbcTemplate jdbcTemplate;
    private final TableService tableService;

    /**
     * **
     * 根据数据名称获取所有表名
     *
     * @param alias
     * @return
     */
    @GetMapping("/list")
    @ResponseBody
    public R list(@RequestParam String alias, @RequestParam(required = false) String tableName) {
        DSContextHolder.setDSType(AliasUtil.getDsId(alias));
        StringBuilder sql = new StringBuilder();
        if (DataTypeEnum.MYSQL.getType().equals(AliasUtil.getDsType(alias))) {
            sql.append("select table_name tableName, table_comment tableComment, create_time createTime from information_schema.tables where table_schema=?")
                    .append(" and table_type='base table'");
            if (StrUtil.isNotBlank(tableName)) {
                sql.append(" and table_name like '%" + tableName + "%'");
            }
        }

        List<Map<String, Object>> list = jdbcTemplate.queryForList(sql.toString(), AliasUtil.getDsName(alias));
        list.stream().forEach(map -> {
            Table table = tableService.getOne(new QueryWrapper<Table>().eq("table_name", map.get("tableName")));
            if (table != null) {
                map.put("isConfig", "1");
            } else {
                map.put("isConfig", "0");
            }
        });
        return R.ok(list);
    }

    @GetMapping("/remove")
    @ResponseBody
    public R remove(@RequestParam String alias, @RequestParam String tableName) {
        DSContextHolder.setDSType(AliasUtil.getDsId(alias));
        StringBuilder sql = new StringBuilder();
        if (DataTypeEnum.MYSQL.getType().equals(AliasUtil.getDsType(alias))) {
            sql.append("drop table ").append(tableName);
        }
        return R.ok();
    }

}
