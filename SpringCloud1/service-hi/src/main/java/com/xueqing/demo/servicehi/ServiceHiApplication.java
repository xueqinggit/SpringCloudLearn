package com.xueqing.demo.servicehi;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@SpringBootApplication
@EnableEurekaClient
@RestController
public class ServiceHiApplication {

    public static void main(String[] args) {
        SpringApplication.run(ServiceHiApplication.class, args);
    }


    @Value("${server.port}")
    String port;

    @RequestMapping("/hi")
    public String home(@RequestParam String name, HttpServletRequest request) {
        request.getSession().setAttribute("user", "111");
        return "hi " + name + ",i am from port:" + port;
    }

    @RequestMapping("/hi2")
    public String home2(@RequestParam String name, HttpServletRequest request) {
        Object user = request.getSession().getAttribute("user");
        return "hi "+name+",i am from port:" +port+user;
    }
}
