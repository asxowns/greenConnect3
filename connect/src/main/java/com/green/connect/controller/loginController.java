package com.green.connect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.connect.dao.IUserDao;
import com.green.connect.dto.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class loginController {
	@Autowired
	IUserDao userDao;
	
	@Autowired
    BCryptPasswordEncoder passwordEncoder; // 비밀번호 인코더 주입

	
	@RequestMapping("/loginForm")
	public String loginForm() {
		
		return "loginForm";
	}
	
	@RequestMapping("/loginDo")
	public String loginDo(HttpSession session, String username, String password) {
		
		// 사용자 정보를 DB에서 가져옴
        User user = userDao.loginDo(username);

        if (user == null || !passwordEncoder.matches(password, user.getPassword())) {
            // 로그인 실패
            return "loginForm"; // 다시 로그인 페이지로 리다이렉트
        }

        //
        SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(username, null, user.getAuthorities()));
        return "redirect:/"; // 메인 페이지로 리다이렉트
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, Authentication authentication) {
		// Spring Security의 로그아웃 처리
        if (authentication != null) {
            SecurityContextHolder.clearContext(); // Security Context 비우기
        }

        return "redirect:/"; // 메인 페이지로 리다이렉트
	}
	
	@RequestMapping("/getusername")
	@ResponseBody
	public String username() {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		System.out.println(username);
		return username;
	}
}
