package com.green.connect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.connect.dao.IUserDao;
import com.green.connect.dto.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class loginController {
	@Autowired
	IUserDao userDao;
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		return "loginForm";
	}
	
	@RequestMapping("/loginDo")
	public String loginDo(@RequestParam("username") String username, 
	                      @RequestParam("password") String password,
	                      HttpServletRequest rq) {
		System.out.println(username+password);
		
		// 사용자 정보를 DB에서 가져옴
	    User user = userDao.loginDo(username);
	    
	    if(user == null || !user.getPassword().equals(password)) {
	    	rq.setAttribute("error", "로그인 실패");
	    	return "loginForm";
	    }
	    
	    HttpSession session = rq.getSession();
	    session.setAttribute("username", user.getUsername());
	    System.out.println("세션아이디"+session.getAttribute("username"));
	    
	    return "redirect:/"; 
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest rq, RedirectAttributes ra) {
		HttpSession session = rq.getSession(false);
		if(session != null) {
			session.invalidate();
			ra.addFlashAttribute("msg", "로그아웃 되었습니다."); // 메시지 추가
		}
		return "/";
	}
}
