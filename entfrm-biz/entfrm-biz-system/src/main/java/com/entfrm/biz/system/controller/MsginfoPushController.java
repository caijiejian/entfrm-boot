package com.entfrm.biz.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.entfrm.biz.system.entity.Msginfo;
import com.entfrm.biz.system.entity.MsginfoPush;
import com.entfrm.biz.system.service.MsginfoPushService;
import com.entfrm.biz.system.service.MsginfoService;
import com.entfrm.core.base.api.R;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Date;


/**
 * @author entfrm
 * @date 2019-08-25 22:46:40
 * @description 消息推送Controller
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/msginfoPush")
public class MsginfoPushController {

    private final MsginfoPushService msginfoPushService;
    private final MsginfoService msginfoService;

    private QueryWrapper<MsginfoPush> getQueryWrapper(MsginfoPush msginfoPush) {
        return new QueryWrapper<MsginfoPush>().eq(StrUtil.isNotBlank(msginfoPush.getIsRead()), "is_read", msginfoPush.getIsRead()).orderByDesc("create_time");
    }

    @PreAuthorize("@ps.hasPerm('msginfoPush_view')")
    @GetMapping("/list")
    @ResponseBody
    public R list(Page page, MsginfoPush msginfoPush) {
        IPage<MsginfoPush> msginfoPushPage = msginfoPushService.page(page, getQueryWrapper(msginfoPush));
        for (MsginfoPush msginfoPush1 : msginfoPushPage.getRecords()) {
            Msginfo msginfo = msginfoService.getById(msginfoPush1.getMsginfoId());
            msginfoPush1.setTitle(msginfo.getTitle());
            msginfoPush1.setType(msginfo.getType());
            msginfoPush1.setContent(msginfo.getContent());
        }
        return R.ok(msginfoPushPage.getRecords(), msginfoPushPage.getTotal());
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(msginfoPushService.getById(id));
    }


    @PreAuthorize("@ps.hasPerm('msginfoPush_add')")
    @PostMapping("/save")
    @ResponseBody
    public R save(@Validated MsginfoPush msginfoPush) {
        if (msginfoPush.getId() != null) {
            msginfoPush.setIsRead("1");
            msginfoPush.setReadTime(new Date());
        }
        msginfoPushService.save(msginfoPush);
        return R.ok();
    }

    @PreAuthorize("@ps.hasPerm('msginfoPush_edit')")
    @PostMapping("/update")
    @ResponseBody
    public R update(@Validated MsginfoPush msginfoPush) {
        msginfoPushService.updateById(msginfoPush);
        return R.ok();
    }

    @PreAuthorize("@ps.hasPerm('msginfoPush_del')")
    @GetMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Integer id) {
        return R.ok(msginfoPushService.removeById(id));
    }
}
