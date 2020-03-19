package com.entfrm.core.data.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yong
 * @date 2020/2/1
 * 树
 */
@Data
public class TreeEntity {

    protected int id;

    protected int parentId;

    protected List<TreeEntity> children = new ArrayList<TreeEntity>();

    public void add(TreeEntity node) {
        children.add(node);
    }
}
