package com.entfrm.biz.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 授权客户端信息
 * </p>
 *
 * @author entfrm
 * @since 2019-01-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("oauth_client_details")
public class ClientDetails implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(type= IdType.INPUT)
    private String clientId;

    /**
     * 资源ids
     */
    private String resourceIds;

    /**
     * 秘钥
     */
    private String clientSecret;

    /**
     * 域
     */
    private String scope;

    /**
     * 授权模式
     */
    private String authorizedGrantTypes;

    /**
     * 重定向地址
     */
    private String webServerRedirectUri;
    /**
     * 授权
     */
    private String authorities;

    /**
     * 令牌时效
     */
    private Integer accessTokenValidity;
    /**
     * 刷新时效
     */
    private Integer refreshTokenValidity;

    /**
     * 附加信息
     */
    private String additionalInformation;
    /**
     * 自动放行
     */
    private String autoapprove;
}
