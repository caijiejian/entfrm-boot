package com.entfrm.auth.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.entfrm.core.base.api.R;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerEndpointsConfiguration;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.InMemoryTokenStore;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.Set;

/**
 * @author yong
 * @date 2020/3/14
 * @description token 管理
 */
@RestController
@AllArgsConstructor
@RequestMapping("/token")
public class TokenController {

    private final TokenStore tokenStore;

    private final AuthorizationServerEndpointsConfiguration endpoints;

    /**
     * 退出token
     *
     * @param authHeader Authorization
     */
    @DeleteMapping("/logout")
    public R logout(@RequestHeader(value = HttpHeaders.AUTHORIZATION, required = false) String authHeader) {
        if (StrUtil.isBlank(authHeader)) {
            return R.error("退出失败，token 为空");
        }

        String tokenValue = authHeader.replace(OAuth2AccessToken.BEARER_TYPE, StrUtil.EMPTY).trim();
        OAuth2AccessToken accessToken = tokenStore.readAccessToken(tokenValue);
        if (accessToken == null || StrUtil.isBlank(accessToken.getValue())) {
            return R.error("退出失败，token 无效");
        }

        // 清空access token
        tokenStore.removeAccessToken(accessToken);

        return R.ok();
    }

    /**
     * 令牌管理调用
     *
     * @param token token
     * @return
     */
    @DeleteMapping("/{token}")
    public R<Boolean> delToken(@PathVariable("token") String token) {
        OAuth2AccessToken oAuth2AccessToken = tokenStore.readAccessToken(token);
        tokenStore.removeAccessToken(oAuth2AccessToken);
        return new R<>();
    }

    /**
     * 查询令牌信息列表
     *
     * @return
     */
    @GetMapping("/list")
    @ResponseBody
    public R list() {
        Collection<OAuth2AccessToken> accessTokens = tokenStore.findTokensByClientId("entfrm");
        return R.ok(JSONUtil.toJsonStr(accessTokens));
    }

}
