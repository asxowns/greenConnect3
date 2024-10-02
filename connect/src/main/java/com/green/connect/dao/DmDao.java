package com.green.connect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.connect.dto.DM;

@Mapper
public interface DmDao {

//	쪽지 보내기
	int sendDm(DM dm);
	
//	내가 보낸 쪽지
	List<DM> mySendDm(@Param("sendUser") String sendUser);

//	내가 받은 쪽지
	List<DM> myReciveDm(@Param("reciveUser") String reciveUser);
	
//	쪽지 상세페이지
	DM dmDetail(@Param("dno") int dno);
	
}
