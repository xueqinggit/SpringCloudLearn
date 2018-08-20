package com.xueqing.demo.sleuthservermiya;

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
import java.util.logging.Level;
import java.util.logging.Logger;

@SpringBootApplication
@RestController
public class SleuthServerMiyaApplication {

    public static void main(String[] args) {
        SpringApplication.run(SleuthServerMiyaApplication.class, args);
    }

    private static final Logger LOG = Logger.getLogger(SleuthServerMiyaApplication.class.getName());


    @RequestMapping("/hi")
    public String home(HttpServletRequest request){
        LOG.log(Level.INFO, "hi is being called");
        request.getSession().setAttribute("miya","111");
        LOG.log(Level.WARNING, "加入成功");
        return "hi i'm miya!";
    }

    @RequestMapping("/miya")
    public String info(HttpServletRequest request){
        LOG.log(Level.INFO, "info is being called");
        LOG.log(Level.INFO, request.getSession().getAttribute("hi")+"");
        LOG.log(Level.WARNING, "获取成功");
        return restTemplate.getForObject("http://localhost:8988/info",String.class);
    }

    @Autowired
    private RestTemplate restTemplate;

    @Bean
    @LoadBalanced
    public RestTemplate getRestTemplate(){
        return new RestTemplate();
    }


    @Bean
    public Sampler defaultSampler() {
        return Sampler.ALWAYS_SAMPLE;
    }
}
