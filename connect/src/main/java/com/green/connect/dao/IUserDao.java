package com.green.connect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.connect.dto.User;

@Mapper
public interface IUserDao {
	
	//로그인
	public User loginDo(@Param("username") String username);
	
	//캘린더 생일 출력
	public List<User> getAllUser();

}
