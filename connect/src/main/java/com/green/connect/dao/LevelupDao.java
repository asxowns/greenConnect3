package com.green.connect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.connect.dto.LevelUp;

@Mapper
public interface LevelupDao {
	
	List<LevelUp> levelupList();
	
	LevelUp getLevelup(@Param("levelno") int levelno);
	
	int updateLevelUp(LevelUp levelup);
	
	int insertLevelUp(LevelUp levelup);
	
	int deleteLevelUp(@Param("levelno") int levelno);
	
	List<LevelUp> getRank();

}
