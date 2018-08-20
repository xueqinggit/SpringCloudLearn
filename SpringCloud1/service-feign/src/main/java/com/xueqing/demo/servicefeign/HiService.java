package com.xueqing.demo.servicefeign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(fallback = HiServiceImpl.class,value = "service-hi")
public interface HiService {
    @RequestMapping(value = "/hi",method = RequestMethod.GET)
    String hi(@RequestParam(value = "name") String name);
}
