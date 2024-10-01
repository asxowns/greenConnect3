package com.green.connect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.connect.dto.DM;
import com.green.connect.dto.User;

@Mapper
public interface JoinDao {

	void insertUser(User user);

	int countByEmail(String email);
	
	List<User> getUsername();

}
