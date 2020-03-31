package com.entfrm.biz.devtool.controller;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.devtool.entity.Column;
import com.entfrm.biz.devtool.entity.Table;
import com.entfrm.biz.devtool.service.ColumnService;
import com.entfrm.biz.devtool.service.TableService;
import com.entfrm.core.base.api.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 代码生成 操作处理
 */
@Controller
@RequestMapping("/devtool/gen")
public class GenController {

    @Autowired
    private TableService tableService;

    @Autowired
    private ColumnService columnService;

    /**
     * 代码生成 配置
     */
    @PostMapping("/getGenTable")
    @ResponseBody
    public R getGenTable(@RequestBody Table table) {
        return R.ok(tableService.getGenTable(table.getTableName(), table.getTableComment()));
    }

    @PutMapping("/update")
    @ResponseBody
    public R update(@RequestBody Table table) {
        tableService.validateEdit(table);
        tableService.updateTable(table);
        return R.ok();
    }

    /**
     * 预览代码
     */
    @GetMapping("/preview/{tableId}")
    @ResponseBody
    public R preview(@PathVariable("tableId") Integer tableId) throws IOException {
        Map<String, String> dataMap = tableService.previewCode(tableId);
        return R.ok(dataMap);
    }

    /**
     * 生成代码
     */
    @GetMapping("/genCode/{tableName}")
    public void genCode(HttpServletResponse response, @PathVariable("tableName") String tableName) throws IOException {
        byte[] data = tableService.generatorCode(tableName);
        genCode(response, data);
    }

    /**
     * 批量生成代码
     */
    @GetMapping("/batchGenCode")
    @ResponseBody
    public void batchGenCode(HttpServletResponse response, String tables) throws IOException {
        String[] tableNames = Convert.toStrArray(tables);

        byte[] data = tableService.generatorCode(tableNames);
        genCode(response, data);
    }

    /**
     * 生成zip文件
     */
    private void genCode(HttpServletResponse response, byte[] data) throws IOException {
        response.reset();
        response.setHeader("Content-Disposition", "attachment; filename=\"entfrm.zip\"");
        response.addHeader("Content-Length", "" + data.length);
        response.setContentType("application/octet-stream; charset=UTF-8");
        IoUtil.write(response.getOutputStream(),true,data);
    }

    /**
     * 查询代码生成列表
     */
    @GetMapping("/list")
    @ResponseBody
    public R genList(Page page, Table table) {
        IPage<Table> tableIPage = tableService.page(page, new QueryWrapper<Table>().like(StrUtil.isNotBlank(table.getTableName()), "table_name", table.getTableName())
                .like(StrUtil.isNotBlank(table.getTableComment()), "table_comment", table.getTableComment()).orderByDesc("create_time"));
        return R.ok(tableIPage.getRecords(), tableIPage.getTotal());
    }


    @GetMapping("/tableList")
    @ResponseBody
    public R tableList() {
        return R.ok(tableService.selectDbTableList(new Table()));
    }

    /**
     * 查询数据表字段列表
     */
    @GetMapping("/columnList")
    @ResponseBody
    public R columnList(Column column) {
        List<Column> list = columnService.list(new QueryWrapper<Column>().eq(!StrUtil.isBlankIfStr(column.getTableId()),"table_id", column.getTableId()).orderByAsc("sort"));
        return R.ok(list, list.size());
    }


    @GetMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        tableService.deleteTableByIds(ids);
        return R.ok();
    }

}
