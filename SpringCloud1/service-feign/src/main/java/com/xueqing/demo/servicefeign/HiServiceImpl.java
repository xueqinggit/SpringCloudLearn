package com.xueqing.demo.servicefeign;

import org.springframework.stereotype.Service;

@Service
public class HiServiceImpl implements  HiService {
    @Override
    public String hi(String name) {
        return "服务出错了";
    }
}
