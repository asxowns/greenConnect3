package com.green.connect.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.connect.dao.IBoardDao;
import com.green.connect.dao.MypageDao;
import com.green.connect.dto.Board;
import com.green.connect.dto.User;

@Controller
public class MainController {
	
	@Autowired
	IBoardDao boardDao;
	
	@Autowired
	private MypageDao mypageDao;
	
	
	@RequestMapping("/")
	public String main(Model model) {
		
		 // 현재 인증된 사용자 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        
        // 비회원일 경우
        if ("anonymousUser".equals(username)) {
            // 비회원에게 필요한 정보를 모델에 추가
        	model.addAttribute("username", "비회원");
        } else {
            // 회원일 경우
            User user = mypageDao.getByUsername(username);
            int myBoardCount = mypageDao.countByMyBoardList(username);
            int myReplyCount = mypageDao.countByMyReplyList(username);
            
            model.addAttribute("username", username);
            model.addAttribute("user", user);
            model.addAttribute("myBoardCount", myBoardCount);
            model.addAttribute("myReplyCount", myReplyCount);
        }
		
		/*
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		
		User user = mypageDao.getByUsername(username);
		int myBoardCount = mypageDao.countByMyBoardList(username);
		int myReplyCount = mypageDao.countByMyReplyList(username);
		
		model.addAttribute("username", username);
		model.addAttribute("user", user);
		model.addAttribute("myBoardCount", myBoardCount);
		model.addAttribute("myReplyCount", myReplyCount);
		*/
		return "main";
	}
	
	
	@RequestMapping("/getBoardPosts")
	@ResponseBody
	public Map<String, List<Board>> getBoardPosts() {
		
		List<Board> board1 = boardDao.getBoardList(1);
		List<Board> board2 = boardDao.getBoardList(2);
		List<Board> board3 = boardDao.getBoardList(3);
		List<Board> board4 = boardDao.getBoardList(4);
		
		Map<String, List<Board>> boardPosts = new HashMap<>();
		boardPosts.put("freeBoard", board1);
		boardPosts.put("jobBoard", board2);
		boardPosts.put("workBoard", board3);
		boardPosts.put("tipBoard", board4);
		
		return boardPosts;
	}
	
}
