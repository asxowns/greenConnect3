package com.green.connect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.connect.dto.Board;
import com.green.connect.dto.Like;
import com.green.connect.dto.Reply;
import com.green.connect.dto.User;

@Mapper
public interface MypageDao {
	
//	내가 작성한 게시글
	List<Board> myBoardList(@Param("username") String username);
	
//	내가 작성한 댓글
	List<Reply> myReplyList(@Param("username") String username);
	
//	내가 좋아요한 게시글
	List<Like> myLikeBoardList(@Param("username") String username);
	
//	username으로 유저 정보 가져오기
	User getByUsername(@Param("username") String username);
	
//	내가 쓴 게시글 갯수
	int countByMyBoardList(@Param("username") String username);
	
//	내가 쓴 댓글 개수
	int countByMyReplyList(@Param("username") String username);

}
