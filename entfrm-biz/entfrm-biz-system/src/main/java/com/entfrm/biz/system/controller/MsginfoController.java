package com.entfrm.biz.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.system.entity.Msginfo;
import com.entfrm.biz.system.service.MsginfoService;
import com.entfrm.core.base.api.R;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * @author entfrm
 * @date 2019-08-25 22:45:45
 * @description 消息Controller
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/msginfo")
public class MsginfoController {

    private final MsginfoService msginfoService;

    private QueryWrapper<Msginfo> getQueryWrapper(Msginfo msginfo) {
        return new QueryWrapper<Msginfo>().orderByDesc("create_time");
    }

    @PreAuthorize("@ps.hasPerm('msginfo_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, Msginfo msginfo) {
        IPage<Msginfo> msginfoPage = msginfoService.page(page, getQueryWrapper(msginfo));
        return R.ok(msginfoPage.getRecords(), msginfoPage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(msginfoService.getById(id));
    }

    @PreAuthorize("@ps.hasPerm('msginfo_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@Validated Msginfo msginfo) {
        msginfoService.saveOrUpdate(msginfo);
        return R.ok();
    }

    @PreAuthorize("@ps.hasPerm('msginfo_edit')")
    @PostMapping("/update")
    @ResponseBody
    public R update(@Validated Msginfo msginfo) {
        msginfoService.updateById(msginfo);
        return R.ok();
    }

    @PreAuthorize("@ps.hasPerm('msginfo_del')")
    @GetMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Integer id) {
        return R.ok(msginfoService.removeById(id));
    }
}
