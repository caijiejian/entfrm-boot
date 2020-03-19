package com.entfrm.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.system.entity.FileInfo;
import com.entfrm.biz.system.service.FileInfoService;
import com.entfrm.core.base.api.R;
import lombok.AllArgsConstructor;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author entfrm
 * @date 2019-09-30 14:17:03
 * @description 文件Controller
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/fileInfo")
public class FileInfoController {

    private final FileInfoService fileInfoService;
    private final JdbcTemplate jdbcTemplate;

    private QueryWrapper<FileInfo> getQueryWrapper(FileInfo fileInfo) {
        return new QueryWrapper<FileInfo>().like(StrUtil.isNotBlank(fileInfo.getName()), "name", fileInfo.getName()).eq(StrUtil.isNotBlank(fileInfo.getStatus()), "status", fileInfo.getStatus()).eq(StrUtil.isNotBlank(fileInfo.getCategory()), "category", fileInfo.getCategory())
                .eq(StrUtil.isNotBlank(fileInfo.getObjId()) && !"null".equals(fileInfo.getObjId()), "obj_id", fileInfo.getObjId()).eq(StrUtil.isNotBlank(fileInfo.getBaseName()) && !"null".equals(fileInfo.getBaseName()), "base_name", fileInfo.getBaseName())
                .orderByDesc("create_time");
    }

    @PreAuthorize("@ps.hasPerm('fileInfo_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, FileInfo fileInfo) {
        IPage<FileInfo> fileInfoPage = fileInfoService.page(page, getQueryWrapper(fileInfo));
        return R.ok(fileInfoPage.getRecords(), fileInfoPage.getTotal());
    }

    @PreAuthorize("@ps.hasPerm('fileInfo_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@RequestBody FileInfo fileInfo) {
        fileInfoService.saveOrUpdate(fileInfo);
        return R.ok();
    }


    @PreAuthorize("@ps.hasPerm('fileInfo_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Integer id) {
        return R.ok(fileInfoService.removeById(id));
    }

    /**
     * 预览图片
     *
     * @param category 文件编号
     */
    @GetMapping("/preview")
    @ResponseBody
    public R preview(@RequestParam String category, @RequestParam String type, @RequestParam String baseName, @RequestParam String objId) {
        List<FileInfo> fileInfoList = fileInfoService.list(new QueryWrapper<FileInfo>().eq(StrUtil.isNotBlank(category),"category", category).eq(StrUtil.isNotBlank(type),"type", type).eq("base_name", baseName).eq("obj_id", objId));
        if (fileInfoList != null && fileInfoList.size() > 0) {
            List<Map<String, Object>> mapList = new ArrayList<>();
            for (FileInfo fileInfo : fileInfoList) {
                Map<String, Object> map = new HashMap<>();
                map.put("src", fileInfo.getThumbnail());
                map.put("name", fileInfo.getName());
                map.put("id", fileInfo.getId());
                mapList.add(map);
            }
            return  R.ok(mapList);
        } else {
            return R.error("暂无数据");
        }
    }
}
