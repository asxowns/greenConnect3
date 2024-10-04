package com.green.connect.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.connect.dao.IBoardDao;
import com.green.connect.dto.Board;

@Controller
public class MainController {
	
	@Autowired
	IBoardDao boardDao;
	
	@RequestMapping("/")
	public String main() {
		
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
