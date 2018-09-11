package com.xueqing.demo.springbootsecurity.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

/**
 * 添加redis配置类启用redis代码spring默认session
 */
@Configuration
@EnableRedisHttpSession
public class RedisSessionConfig {
}
