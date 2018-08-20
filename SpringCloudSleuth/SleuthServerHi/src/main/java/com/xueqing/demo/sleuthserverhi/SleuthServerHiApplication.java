package com.xueqing.demo.sleuthserverhi;

import java.util.logging.Level;
import java.util.logging.Logger;

import brave.sampler.Sampler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;

@SpringBootApplication
@RestController
public class SleuthServerHiApplication {

    public static void main(String[] args) {
        SpringApplication.run(SleuthServerHiApplication.class, args);
    }

    private static final Logger LOG = Logger.getLogger(SleuthServerHiApplication.class.getName());


    @Autowired
    private RestTemplate restTemplate;

    @Bean
    @LoadBalanced
    public RestTemplate getRestTemplate(){
        return new RestTemplate();
    }

    @RequestMapping("/hi")
    public String callHome(HttpServletRequest request){
        LOG.log(Level.INFO, "calling trace service-hi  ");
        request.getSession().setAttribute("hi","111");
        LOG.log(Level.WARNING, "加入成功");
        return restTemplate.getForObject("http://localhost:8989/miya", String.class);
    }
    @RequestMapping("/info")
    public String info(HttpServletRequest request){
        LOG.log(Level.INFO, request.getSession().getAttribute("miya")+"");
        LOG.log(Level.WARNING, "获取成功");
        return "i'm service-hi";

    }

    @Bean
    public Sampler defaultSampler() {
        return Sampler.ALWAYS_SAMPLE;
    }


}