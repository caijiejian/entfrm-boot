package com.entfrm.core.base.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author yong
 * @date 2020/3/19
 * @description entfrm 配置
 */
@Component
@ConfigurationProperties(prefix = "entfrm")
public class EntfrmConfig {

    private static String name;

    private static String version;

    private static String profile;

    private static String addressSwitch;

    private static String redisSwitch;

    private static String lang;


    public static String getName() {
        return name;
    }

    public static void setName(String name) {
        EntfrmConfig.name = name;
    }

    public static String getVersion() {
        return version;
    }

    public static void setVersion(String version) {
        EntfrmConfig.version = version;
    }

    public static String getProfile() {
        return profile;
    }

    public static void setProfile(String profile) {
        EntfrmConfig.profile = profile;
    }

    public static String getAddressSwitch() {
        return addressSwitch;
    }

    public static void setAddressSwitch(String addressSwitch) {
        EntfrmConfig.addressSwitch = addressSwitch;
    }

    public static String getRedisSwitch() {
        return redisSwitch;
    }

    public static void setRedisSwitch(String redisSwitch) {
        EntfrmConfig.redisSwitch = redisSwitch;
    }

    public static String getLang() {
        return lang;
    }

    public static void setLang(String lang) {
        EntfrmConfig.lang = lang;
    }

}
