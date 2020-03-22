package com.entfrm.biz.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.system.entity.Area;
import com.entfrm.biz.system.service.AreaService;
import com.entfrm.core.base.api.R;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


/**
 * @author entfrm
 * @date 2019-10-11 09:13:04
 * @description 区域Controller
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/area")
public class AreaController {

    private final AreaService areaService;

    private QueryWrapper<Area> getQueryWrapper(Area area) {
        return new QueryWrapper<Area>().orderByDesc("create_time");
    }

    @PreAuthorize("@ps.hasPerm('area_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, Area area) {
        IPage<Area> areaPage = areaService.page(page, getQueryWrapper(area));
        return R.ok(areaPage.getRecords(), areaPage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(areaService.getById(id));
    }

    @PreAuthorize("@ps.hasPerm('area_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@RequestBody Area area) {
        if(area.getId() == null){
            area.setParentId(0);
            area.setAncestors("0");
            area.setType("0");
        }
        areaService.save(area);
        return R.ok();
    }

    @PreAuthorize("@ps.hasPerm('area_edit')")
    @PutMapping("/update")
    @ResponseBody
    public R update(@RequestBody Area area) {
        areaService.updateById(area);
        return R.ok();
    }

    @PreAuthorize("@ps.hasPerm('area_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Integer id) {
        return R.ok(areaService.removeById(id));
    }
}
