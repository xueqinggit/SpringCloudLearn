package com.xueqing.demo.springbootsecurity.service;

import com.xueqing.demo.springbootsecurity.bean.User;
import com.xueqing.demo.springbootsecurity.bean.UserRoles;

import java.util.List;

public interface UserService  {
     User getUserInfo(User user);

     User loadUserByUsername(String s);

     List<User> getAllUsers();
}
