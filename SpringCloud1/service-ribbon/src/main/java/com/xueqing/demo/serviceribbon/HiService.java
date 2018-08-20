package com.xueqing.demo.serviceribbon;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
@Service
public class HiService {

    @Autowired
    RestTemplate restTemplate;

    @HystrixCommand(fallbackMethod = "error")
    public String hi( String name){
        return restTemplate.getForObject("http://SERVICE-HI/hi?name="+name,String.class);
    }


    public String error( String name){
        return "服务出错了";
    }
}
