package com.entfrm.core.base.util;

import com.entfrm.core.base.config.GlobalConfig;
import lombok.extern.slf4j.Slf4j;
import org.lionsoul.ip2region.DataBlock;
import org.lionsoul.ip2region.DbConfig;
import org.lionsoul.ip2region.DbSearcher;
import org.lionsoul.ip2region.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.lang.reflect.Method;

/**
 * @author yong
 * @date 2019/6/12
 * @description 根据IP地址获取城市
 */
@Slf4j
public class AddressUtil {

    public static String getCityInfo(String ip) {
        DbSearcher searcher = null;
        try {
            String dbPath = GlobalConfig.getProfile() + "ip2region/ip2region.db";
            //String dbPath = "f:/profile/ip2region/ip2region.db";  //本地测试使用地址
            File file = new File(dbPath);
            if (file.exists()) {
                DbConfig config = new DbConfig();
                searcher = new DbSearcher(config, file.getPath());
                Method method = searcher.getClass().getMethod("btreeSearch", String.class);
                if (!Util.isIpAddress(ip)) {
                    log.error("Error: Invalid ip address");
                }
                DataBlock dataBlock = (DataBlock) method.invoke(searcher, ip);
                return dataBlock.getRegion();
            }
        } catch (Exception e) {
            log.error("获取地址信息异常：{}", e.getLocalizedMessage());
        }
        return "XX XX";
    }

    public static void main(String[] args) {

        System.out.println(getCityInfo("115.218.10.198"));
    }
}
