package com.green.connect.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.connect.dto.User;

@Mapper
public interface IUserDao {
	
	//로그인
	public User loginDo(@Param("username") String username);
	
	
	
}
