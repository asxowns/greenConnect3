package com.green.connect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.green.connect.dao.IUserDao;
import com.green.connect.dao.JoinDao;
import com.green.connect.dto.User;

@Service
public class LoginService {
	
	@Autowired
	private IUserDao userDao;
	
	@Autowired
	private JoinDao joinDao;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//사용자 등록시 비밀번호 암호화
	public void registUser(User user) {
		user.setRole("ROLE_USER");
		
		String encodePassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodePassword);
		joinDao.insertUser(user); //사용자정보를 데이터베이스에 저장 
	}
}
