package com.green.connect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.connect.dto.Board;
import com.green.connect.dto.Like;
import com.green.connect.dto.Reply;

@Mapper
public interface MypageDao {
	
//	내가 작성한 게시글
	List<Board> myBoardList(@Param("username") String username);
	
//	내가 작성한 댓글
	List<Reply> myReplyList(@Param("username") String username);
	
//	내가 좋아요한 게시글
	List<Like> myLikeBoardList(@Param("username") String username);

}
