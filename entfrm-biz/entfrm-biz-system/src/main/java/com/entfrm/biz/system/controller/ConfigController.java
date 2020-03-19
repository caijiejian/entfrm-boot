package com.entfrm.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.system.entity.Config;
import com.entfrm.biz.system.service.ConfigService;
import com.entfrm.core.base.api.R;
import com.entfrm.core.log.annotation.OperLog;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

/**
 * 参数信息
 *
 * @author entfrm
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/config")
public class ConfigController {

    private final ConfigService configService;

    private QueryWrapper<Config> getQueryWrapper(Config config) {
        return new QueryWrapper<Config>().like(StrUtil.isNotBlank(config.getName()), "name", config.getName()).orderByDesc("id")
                .eq(StrUtil.isNotBlank(config.getKey()), "`key`", config.getKey()).eq(StrUtil.isNotBlank(config.getIsSys()), "is_sys", config.getIsSys())
                .between(StrUtil.isNotBlank(config.getBeginTime()) && StrUtil.isNotBlank(config.getEndTime()), "create_time", config.getBeginTime(), config.getEndTime());
    }

    @PreAuthorize("@ps.hasPerm('config_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, Config config) {
        IPage<Config> configPage = configService.page(page, getQueryWrapper(config));
        return R.ok(configPage.getRecords(), configPage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(configService.getById(id));
    }

    @GetMapping("/getByKey/{key}")
    public R getByKey(@PathVariable("key") String key) {
        Config config = configService.getOne(new QueryWrapper<Config>().eq("`key`", key));
        if(config != null){
            return R.ok(config.getValue());
        }
        return R.ok();
    }


    @OperLog("参数新增")
    @PreAuthorize("@ps.hasPerm('config_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@Validated Config config) {
        configService.save(config);
        return R.ok();
    }

    @OperLog("参数修改")
    @PreAuthorize("@ps.hasPerm('config_edit')")
    @PutMapping("/update")
    @ResponseBody
    public R update(@Validated Config config) {
        configService.updateById(config);
        return R.ok();
    }

    @OperLog("参数删除")
    @PreAuthorize("@ps.hasPerm('config_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable String id) {
        try {
            configService.removeById(id);
            return R.ok();
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
    }
}
