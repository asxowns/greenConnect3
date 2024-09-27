package com.green.connect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.connect.dao.EmailDao;
import com.green.connect.dao.JoinDao;
import com.green.connect.dto.User;
import com.green.connect.service.MailService;
import com.green.connect.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class JoinController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private EmailDao emailDao;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private JoinDao joinDao;
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		
		return "common/joinForm";
	}
	
	@PostMapping("/sendVerification")
    @ResponseBody
    public ResponseEntity<String> sendVerificationEmail(@RequestParam("email") String email, @RequestParam("username") String username) {
        try {
            mailService.sendVerificationEmail(email, username);
            return ResponseEntity.ok("인증 코드가 전송되었습니다.");
        } catch (Exception e) {
            log.error("Error sending verification email", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("인증 코드 전송에 실패했습니다: " + e.getMessage());
        }
    }

	@PostMapping("/verifyEmail")
    @ResponseBody
    public ResponseEntity<String> verifyEmail(@RequestParam("email") String email, @RequestParam("code") String code) {
        try {
            boolean isVerified = mailService.verifyEmail(email, code);
            if (isVerified) {
                return ResponseEntity.ok("이메일 인증이 완료되었습니다.");
            } else {
                return ResponseEntity.badRequest().body("이메일 인증에 실패했습니다. 코드를 다시 확인해주세요.");
            }
        } catch (Exception e) {
            log.error("Error during email verification for email: {}", email, e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류가 발생했습니다.");
        }
    }

	@PostMapping("/join")
	@ResponseBody
	@Transactional
	public ResponseEntity<String> join(@RequestBody User user) {
	    try {
	        log.info("Received join request for user: {}", user);
	        
	        if (userService.isEmailExists(user.getEmail())) {
	            return ResponseEntity.badRequest().body("이미 등록된 이메일입니다.");
	        }

	        if (mailService.isEmailVerified(user.getEmail())) {
	            userService.registerUser(user, user.getEmail());
	            return ResponseEntity.ok("회원가입이 완료되었습니다.");
	        } else {
	            return ResponseEntity.badRequest().body("이메일 인증이 완료되지 않았습니다.");
	        }
	    } catch (Exception e) {
	        log.error("Error during user registration", e);
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("회원가입에 실패했습니다: " + e.getMessage());
	    }
	}
	
	@RequestMapping("/getUsername")
	@ResponseBody
	public List<User> getUsername() {
		
		return joinDao.getUsername();
	}
	

}
