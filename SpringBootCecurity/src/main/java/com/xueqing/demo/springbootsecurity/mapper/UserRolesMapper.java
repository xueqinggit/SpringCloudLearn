package com.xueqing.demo.springbootsecurity.mapper;

import com.xueqing.demo.springbootsecurity.bean.UserRoles;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserRolesMapper {
    @Select("select user_id,role_id from user_roles where user_id = #{userId}")
    @Results(value = {@Result(property = "userId",column = "user_id"),
                      @Result(property = "roleId",column = "role_id"),
                      })
    public List<UserRoles> getRolesBeanById(UserRoles userRoles);
}
