package com.xueqing.demo.springbootsecurity.mapper;

import com.xueqing.demo.springbootsecurity.bean.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    public User getUserInfo(User user);

    User loadUserByUsername(String s);

    List<User> getAllUsers();
}
