package com.xueqing.demo.springbootsecurity.service;

import com.xueqing.demo.springbootsecurity.bean.Menu;

import java.util.List;


public interface MenuService {

    List<Menu> getMenusByUserId(Integer userId);
}
