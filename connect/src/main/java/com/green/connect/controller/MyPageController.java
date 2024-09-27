package com.green.connect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.connect.dao.MypageDao;
import com.green.connect.dto.Board;
import com.green.connect.dto.Like;
import com.green.connect.dto.Reply;

@Controller
@RequestMapping("/my")
public class MyPageController {
	
	@Autowired
	private MypageDao mypageDao;
	
	@RequestMapping("/myPageMain")
	public String myPageMain() {
		
		return "mypage/myPageMain";
	}

//	내가 작성한 게시글
	@GetMapping("/myBoardList")
	@ResponseBody
	public List<Board> myBoardList(@RequestParam("username") String username) {
		
		List<Board> boards = mypageDao.myBoardList(username);
		System.out.println("boards: " + boards);
		
		return boards;
	}
	
//	내가 작성한 댓글
	@GetMapping("/myReplyList")
	@ResponseBody
	public List<Reply> myReplyList(@RequestParam("username") String username){
	
		List<Reply> replys = mypageDao.myReplyList(username);
		System.out.println("reply: " + replys);
		
		return replys;
	}
	
//	내가 좋아요한 게시글
	@GetMapping("/myLikeBoardList")
	@ResponseBody
	public List<Like> myLikeBoardList(@RequestParam("username") String username) {
		
		List<Like> likes = mypageDao.myLikeBoardList(username);
		System.out.println(likes);
		
		return likes;
	}
	
	
	
	
	
}
