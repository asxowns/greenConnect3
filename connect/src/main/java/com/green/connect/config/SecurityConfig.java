package com.green.connect.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity // Spring Security의 웹 보안 지원을 활성화
public class SecurityConfig {

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
		// 비밀번호 해싱에 사용할 BCryptPasswordEncoder 반환
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		// HTTP 보안 설정 시작
		http.authorizeHttpRequests(auth -> auth // HTTP 요청 권한 설정
                .requestMatchers("/**", "/", "/loginForm", "/loginDo", "/join", "/sendVerification", "/verifyEmail")
                .permitAll() // 위 URL들은 모든 사용자에게 허용
                .anyRequest().authenticated()); // 나머지 요청은 인증 필요

        http.formLogin(login -> login // 폼 로그인 설정
                .loginPage("/loginForm") // 로그인 페이지 URL 설정
                .loginProcessingUrl("/loginDo") // 로그인 처리 URL 설정
                .permitAll()); // 모든 사용자에게 로그인 페이지 접근 허용

        http.logout(logout -> logout // 로그아웃 설정
                .logoutUrl("/logout") // 로그아웃 요청 URL 설정
                .logoutSuccessUrl("/") // 로그아웃 성공 후 이동할 페이지
                .invalidateHttpSession(true) // 세션 무효화
                .deleteCookies("JSESSIONID") // 쿠키 삭제
                .permitAll()); // 모든 사용자에게 로그아웃 페이지 접근 허용
        
        http.sessionManagement(session -> session.maximumSessions(1) // 최대 세션 수 설정
                .expiredUrl("/login?expired")); // 세션 만료 시 리다이렉트 URL

        http.csrf(csrf -> csrf.disable()); // CSRF 보호 비활성화

		return http.build();
	}
}


