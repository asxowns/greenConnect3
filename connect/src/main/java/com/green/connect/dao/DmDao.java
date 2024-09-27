package com.green.connect.dao;

import org.apache.ibatis.annotations.Mapper;

import com.green.connect.dto.DM;

@Mapper
public interface DmDao {

	int sendDm(DM dm);
	
}
