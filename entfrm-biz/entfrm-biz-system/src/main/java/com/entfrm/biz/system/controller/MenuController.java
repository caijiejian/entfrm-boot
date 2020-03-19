package com.entfrm.biz.system.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.setting.SettingUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.entfrm.biz.system.entity.Menu;
import com.entfrm.biz.system.entity.Role;
import com.entfrm.biz.system.entity.RoleMenu;
import com.entfrm.biz.system.entity.User;
import com.entfrm.biz.system.service.MenuService;
import com.entfrm.biz.system.service.RoleMenuService;
import com.entfrm.biz.system.service.UserService;
import com.entfrm.biz.system.vo.ResultVo;
import com.entfrm.core.base.api.R;
import com.entfrm.core.data.util.TreeUtil;
import com.entfrm.core.log.annotation.OperLog;
import com.entfrm.core.security.util.SecurityUtil;
import lombok.AllArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 菜单信息
 *
 * @author entfrm
 */
@RestController
@AllArgsConstructor
@RequestMapping("/system/menu")
public class MenuController {

    private final MenuService menuService;
    private final RoleMenuService roleMenuService;
    private final UserService userService;

    private QueryWrapper<Menu> getQueryWrapper(Menu menu) {
        return new QueryWrapper<Menu>().like(StrUtil.isNotBlank(menu.getName()), "name", menu.getName()).eq(StrUtil.isNotBlank(menu.getStatus()), "status", menu.getStatus()).orderByAsc("sort")
                .between(StrUtil.isNotBlank(menu.getBeginTime()) && StrUtil.isNotBlank(menu.getEndTime()), "create_time", menu.getBeginTime(), menu.getEndTime());
    }

    @PreAuthorize("@ps.hasPerm('menu_view')")
    @GetMapping("/list")
    public R list(Menu menu) {
        List<Menu> menuList = menuService.list(getQueryWrapper(menu));
        if(menuList.size() >0 ){
            for(Menu menu1 : menuList){
                if(StrUtil.isNotBlank(menu.getName()) || StrUtil.isNotBlank(menu.getStatus())){
                    menu1.setParentId(0);
                }
            }
        }
        return R.ok(menuList, menuList.size());
    }

    @GetMapping
    public R getMenus() {
        Set<Menu> menuSet = new HashSet<>();
        SecurityUtil.getRoles().forEach(roleId -> menuSet.addAll(menuService.selectMenuListByRoleId(roleId)));
        List<Menu> menuList = menuSet.stream().sorted(Comparator.comparingInt(Menu::getSort)).collect(Collectors.toList());
        return R.ok(menuService.buildMenus(menuService.buildTree(menuList, 0)));
    }

    @GetMapping("/{id}")
    public R getById(@PathVariable("id") Integer id) {
        return R.ok(menuService.getById(id));
    }

    @OperLog("菜单新增")
    @PreAuthorize("@ps.hasPerm('menu_add')")
    @PostMapping("/save")
    public R save(@RequestBody Menu menu) {
        menuService.save(menu);
        return R.ok();
    }

    @OperLog("菜单修改")
    @PreAuthorize("@ps.hasPerm('menu_edit')")
    @PutMapping("/update")
    public R update(@RequestBody Menu menu) {
        menuService.updateById(menu);
        return R.ok();
    }

    @OperLog("菜单删除")
    @PreAuthorize("@ps.hasPerm('menu_del')")
    @DeleteMapping("/remove/{id}")
    @ResponseBody
    public R remove(@PathVariable("id") Integer id) {
        if (menuService.getOne(new QueryWrapper<Menu>().eq("parent_id", id)) != null) {
            return R.error("存在子菜单,不允许删除");
        }
        if (roleMenuService.getOne(new QueryWrapper<RoleMenu>().eq("menu_id", id)) != null) {
            return R.error("菜单已分配,不允许删除");
        }
        menuService.removeById(id);
        return R.ok();
    }

    @OperLog("菜单状态更改")
    @PreAuthorize("@ps.hasPerm('menu_edit')")
    @GetMapping("/changeStatus")
    public R changeStatus(Menu menu) {
        menuService.updateById(menu);
        return R.ok();
    }

    /**
     * 加载所有菜单列表树
     */
    @GetMapping("/menuTree")
    @ResponseBody
    public R menuTree() {
        List<Menu> menuList = menuService.list(new QueryWrapper<Menu>().orderByAsc("sort"));
        return R.ok(menuService.buildTree(menuList, 0));
    }

    /**
     * 加载角色菜单列表树
     */
    @GetMapping("/roleMenuTree/{roleId}")
    public R roleMenuTree(@PathVariable Integer roleId) {
        List<Menu> menuList = menuService.list(new QueryWrapper<Menu>().orderByAsc("sort"));
        return R.ok(ResultVo.builder().result(menuService.buildTree(menuList, 0)).extend(menuService.selectMenusByRoleId(roleId)).build());
    }

}
