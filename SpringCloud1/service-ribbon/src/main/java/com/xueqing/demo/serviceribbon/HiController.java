package com.xueqing.demo.serviceribbon;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class HiController {
    @Autowired
    HiService hiService;

    @RequestMapping("/hi")
    public String hi(@RequestParam String name){
        return hiService.hi(name);
    }
}
