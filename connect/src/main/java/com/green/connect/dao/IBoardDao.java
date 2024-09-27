package com.green.connect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.connect.dto.Board;
import com.green.connect.dto.Category;
import com.green.connect.dto.Like;
import com.green.connect.dto.Reply;
import com.green.connect.dto.User;

@Mapper
public interface IBoardDao {
	//categoryNo값 얻어내기
	public List<Category> getCategoryList(); 
	//categoryName값 얻어내기
	public String getCategoryName(@Param("categoryNo") int categoryNo);
	//게시판 글 작성자 정보
	public User getUserName(@Param("username") String username);
	//게시판 글 등록
	public void registBoard(@Param("board") Board board);
	//파일 게시판 글 등록
	public void registFileBoard(@Param("board") Board board);
	//게시판 글 리스트
	public List<Board> getBoardList(@Param("categoryNo") int categoryNo);
	//게시물 디테일 페이지
	public Board getBoardDetail(@Param("bno") int bno);
	//게시물 조회수 업데이트
	public void boardViewCnt(@Param("view") int view, @Param("bno") int bno);
	//게시물 좋아요 상태 (로그인 유저)
	public Like getLikeState(@Param("username") String loginUsername, @Param("bno") int bno);
	//게시물 총 좋아요 수
	public int getBoardTotalLike(@Param("bno") int bno);
	//게시믈 로그인 회원 좋아요 조회 
	public int getBoardLikeCheck(@Param("bno") int bno, @Param("username") String username);
	//게시물 좋아요 추가
	public void regBoardLike(@Param("like") Like like);
	//게시물 좋아요 상태 수정
	public void updateBoardLike(@Param("bno") int bno, @Param("username") String username, @Param("likeState") boolean likeState);
	//게시물 댓글 리스트
	public List<Reply> getReplyList(@Param("bno") int bno);
	//게시물 댓글 등록
	public void regReply(@Param("reply") Reply reply);
	
	
}
