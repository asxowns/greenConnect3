package com.green.connect.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.green.connect.dao.IUserDao;
import com.green.connect.dto.User;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	//주어진 사용자 이름으로 사용자 정보를 찾아 CustomUserDetails 객체로 반환
	@Autowired
	private IUserDao userDao;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// 사용자 정보를 찾아서 CustomUserDetails로 반환
		
		User user = userDao.loginDo(username);
		
		if(user != null) {
			return new CustomUserDetails(user);
		}
		
		throw new UsernameNotFoundException("로그인 실패");
	}
	
	// 원시 비밀번호와 인코딩된 비밀번호를 비교하는 메서드
	public boolean validatePassword(String rawPassword, String encodedPassword) {
        return passwordEncoder.matches(rawPassword, encodedPassword); // 비밀번호 일치 여부 확인
    }
}
