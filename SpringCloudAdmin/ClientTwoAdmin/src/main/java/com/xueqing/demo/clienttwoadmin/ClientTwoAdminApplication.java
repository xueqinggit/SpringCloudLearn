package com.xueqing.demo.clienttwoadmin;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@SpringBootApplication
public class ClientTwoAdminApplication {

    public static void main(String[] args) {
        SpringApplication.run(ClientTwoAdminApplication.class, args);
    }


    @Value("${server.port}")
    String port;
    @GetMapping("/hi")
    @HystrixCommand(fallbackMethod = "hiError")
    public String hi(@RequestParam(required = false,defaultValue = "cralor")String name){
        return "hi "+name+",i am client two and from port:"+port;
    }
    public String hiError(String name){
        return "hi "+name+",sorry,error!";
    }
}
