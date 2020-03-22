package com.entfrm.biz.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.system.entity.MsginfoTemplate;
import com.entfrm.biz.system.service.MsginfoTemplateService;
import com.entfrm.core.base.api.R;
import lombok.AllArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


/**
 * @author entfrm
 * @date 2019-10-13 20:06:20
 * @description 消息模板Controller
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/msginfoTemplate")
public class MsginfoTemplateController {

    private final MsginfoTemplateService msginfoTemplateService;
    private final RedisTemplate redisTemplate;

    private QueryWrapper<MsginfoTemplate> getQueryWrapper(MsginfoTemplate msginfoTemplate) {
        return new QueryWrapper<MsginfoTemplate>().orderByDesc("create_time");
    }

    @PreAuthorize("@ps.hasPerm('msginfoTemplate_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, MsginfoTemplate msginfoTemplate) {
        IPage<MsginfoTemplate> msginfoTemplatePage = msginfoTemplateService.page(page, getQueryWrapper(msginfoTemplate));
        return R.ok(msginfoTemplatePage.getRecords(), msginfoTemplatePage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(msginfoTemplateService.getById(id));
    }


    @PreAuthorize("@ps.hasPerm('msginfoTemplate_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@Validated MsginfoTemplate msginfoTemplate) {
        redisTemplate.opsForValue().set("tpl_" + msginfoTemplate.getTplKey(), msginfoTemplate.getTplContent());
        msginfoTemplateService.save(msginfoTemplate);
        return R.ok();
    }

    @PreAuthorize("@ps.hasPerm('msginfoTemplate_edit')")
    @PostMapping("/update")
    @ResponseBody
    public R update(@Validated MsginfoTemplate msginfoTemplate) {
        redisTemplate.opsForValue().set("tpl_" + msginfoTemplate.getTplKey(), msginfoTemplate.getTplContent());
        msginfoTemplateService.updateById(msginfoTemplate);
        return R.ok();
    }

    @PreAuthorize("@ps.hasPerm('msginfoTemplate_del')")
    @GetMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Integer id) {
        return R.ok(msginfoTemplateService.removeById(id));
    }

    /**
     * 用户状态修改
     */
    @PreAuthorize("@ps.hasPerm('msginfoTemplate_edit')")
    @GetMapping("/changeStatus")
    @ResponseBody
    public R changeStatus(MsginfoTemplate msginfoTemplate) {
        msginfoTemplateService.updateById(msginfoTemplate);
        return R.ok();
    }
}
