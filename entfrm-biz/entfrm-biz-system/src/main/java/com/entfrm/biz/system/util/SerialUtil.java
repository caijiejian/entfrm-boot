package com.entfrm.biz.system.util;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.entfrm.biz.system.entity.Serial;
import com.entfrm.biz.system.mapper.SerialMapper;
import com.entfrm.core.base.util.PinyinUtil;
import com.entfrm.core.base.util.SpringContextUtil;
import com.entfrm.core.base.util.StrUtil;

import java.util.Date;

/**
 * @author entfrm
 * @date 2019/9/7
 * @description 序号生成 工具
 */
public class SerialUtil {

    private static SerialMapper serialMapper = SpringContextUtil.getBean("serialMapper");

    /**
     * 生成档案编号
     *
     * @return
     */
    public static String genArcCode(String year, String deptName, String type) {
        String prefix = year + "-" + StrUtil.swapCase(PinyinUtil.getAllFirstLetter(deptName)) + getType(type);
        Serial serial = serialMapper.selectOne(new QueryWrapper<Serial>().eq("classify", prefix).last("limit 1").orderByDesc("update_time"));
        if (serial != null) {
            return prefix + "-" + serial.getSerialNo();
        } else {
            serial = new Serial();
            serial.setClassify(prefix);
            serial.setSerialNo(1);
            serial.setUpdateTime(new Date());
            serialMapper.insert(serial);
            return prefix + "-1";
        }
    }

    /**
     * 生成档案编号1  POS特约商户
     *
     * @return
     */
    public static String genArcCode1(String prefix) {
        Serial serial = serialMapper.selectOne(new QueryWrapper<Serial>().eq("classify", prefix).last("limit 1").orderByDesc("update_time"));
        if (serial != null) {
            return prefix + String.format("%03d", serial.getSerialNo());
        } else {
            serial = new Serial();
            serial.setClassify(prefix);
            serial.setSerialNo(1);
            serial.setUpdateTime(new Date());
            serialMapper.insert(serial);
            return prefix + "001";
        }
    }

    /**
     * 生成档案编号2  金碧贷记卡
     *
     * @return
     */
    public static String genArcCode2(String prefix) {
        Serial serial = serialMapper.selectOne(new QueryWrapper<Serial>().eq("classify", prefix).last("limit 1").orderByDesc("update_time"));
        if (serial != null) {
            return prefix + String.format("%04d", serial.getSerialNo());
        } else {
            serial = new Serial();
            serial.setClassify(prefix);
            serial.setSerialNo(1);
            serial.setUpdateTime(new Date());
            serialMapper.insert(serial);
            return prefix + "0001";
        }
    }

    private static String getType(String type) {
        switch (type) {
            case "1":
                return "YSF";
            case "2":
                return "ESF";
            default:
                return "";
        }
    }

    /**
     * 档案编号+1
     *
     * @return
     */
    public static void addOneArcCode(String year, String deptName, String type) {
        String prefix = year + "-" + StrUtil.swapCase(PinyinUtil.getAllFirstLetter(deptName)) + getType(type);
        Serial serial = serialMapper.selectOne(new QueryWrapper<Serial>().eq("classify", prefix).last("limit 1").orderByDesc("update_time"));
        if (serial != null) {
            serial.setClassify(prefix);
            serial.setSerialNo(serial.getSerialNo() + 1);
            serial.setUpdateTime(new Date());
            serialMapper.insert(serial);
        }
    }

    /**
     * 生成RFID编号
     *
     * @return
     */
    public static String genRFIDCode(String code) {
        Serial serial = serialMapper.selectOne(new QueryWrapper<Serial>().eq("classify", code).last("limit 1").orderByDesc("update_time"));
        if (serial != null) {
            return String.format("%010d", serial.getSerialNo());
        } else {
            serial = new Serial();
            serial.setClassify(code);
            serial.setSerialNo(1);
            serial.setUpdateTime(new Date());
            serialMapper.insert(serial);
            return "0000000001";
        }
    }

    /**
     * RFID编号+1
     *
     * @return
     */
    public static void addOneRFIDCode(String code) {
        Serial serial = serialMapper.selectOne(new QueryWrapper<Serial>().eq("classify", code).last("limit 1").orderByDesc("update_time"));
        if (serial != null) {
            serial.setClassify(code);
            serial.setSerialNo(serial.getSerialNo() + 1);
            serial.setUpdateTime(new Date());
            serialMapper.insert(serial);
        }
    }
}
