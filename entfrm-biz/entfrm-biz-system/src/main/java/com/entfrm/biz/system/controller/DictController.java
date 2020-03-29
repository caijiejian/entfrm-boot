package com.entfrm.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.system.entity.Dict;
import com.entfrm.biz.system.service.DictService;
import com.entfrm.core.base.api.R;
import com.entfrm.core.log.annotation.OperLog;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 数据字典信息
 *
 * @author entfrm
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/dict")
public class DictController {

    private final DictService dictService;

    private QueryWrapper<Dict> getQueryWrapper(Dict dict) {
        return new QueryWrapper<Dict>().like(StrUtil.isNotBlank(dict.getName()), "name", dict.getName()).orderByDesc("id")
                .eq(StrUtil.isNotBlank(dict.getType()), "type", dict.getType()).eq(StrUtil.isNotBlank(dict.getStatus()), "status", dict.getStatus());
    }

    @PreAuthorize("@ps.hasPerm('dict_view')")
    @GetMapping("/list")
    public R list(Page page, Dict dict) {
        IPage<Dict> dictPage = dictService.page(page, getQueryWrapper(dict));
        return R.ok(dictPage.getRecords(), dictPage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(dictService.getById(id));
    }

    @OperLog("字典新增")
    @PreAuthorize("@ps.hasPerm('dict_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@RequestBody Dict dict) {
        dictService.save(dict);
        return R.ok();
    }

    @OperLog("字典修改")
    @PreAuthorize("@ps.hasPerm('dict_edit')")
    @PutMapping("/update")
    @ResponseBody
    public R update(@RequestBody Dict dict) {
        dictService.updateById(dict);
        return R.ok();
    }

    @OperLog("字典删除")
    @PreAuthorize("@ps.hasPerm('dict_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable String id) {
        try {
            dictService.removeById(id);
            return R.ok();
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
    }

    @OperLog("字典状态更改")
    @PreAuthorize("@ps.hasPerm('dict_edit')")
    @GetMapping("/changeStatus")
    @ResponseBody
    public R changeStatus(Dict dict) {
        dictService.updateById(dict);
        return R.ok();
    }

    /**
     * 获取所有字典列表
     */
    @GetMapping("/dictList")
    public R dictList() {
        List<Dict> dictList = dictService.list();
        return R.ok(dictList);
    }
}
