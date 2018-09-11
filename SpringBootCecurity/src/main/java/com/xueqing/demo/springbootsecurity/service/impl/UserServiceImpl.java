package com.xueqing.demo.springbootsecurity.service.impl;

import com.xueqing.demo.springbootsecurity.bean.User;
import com.xueqing.demo.springbootsecurity.bean.UserRoles;
import com.xueqing.demo.springbootsecurity.mapper.UserMapper;
import com.xueqing.demo.springbootsecurity.mapper.UserRolesMapper;
import com.xueqing.demo.springbootsecurity.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserInfo(User user) {
        User userInfo = userMapper.getUserInfo(user);
        return userInfo;
    }

    @Override
    public User loadUserByUsername(String s) {
        return userMapper.loadUserByUsername(s);
    }

    @Override
    public List<User> getAllUsers() {
        return userMapper.getAllUsers();
    }
}
