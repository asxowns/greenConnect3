package com.green.connect.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.connect.dao.IUserDao;
import com.green.connect.dto.User;

@RestController
public class CalendarController {
	
	@Autowired
	IUserDao userDao;
	
	@RequestMapping("/events")
	@ResponseBody
	public List<Map<String, Object>> getEvents() {
		List<Map<String, Object>> events = new ArrayList<>();
		
		Map<String, Object> event = new HashMap<>();
		event.put("title", "회의");
		event.put("start", "2024-10-05"); 
		events.add(event);
		
		return events;
	}
	
	@RequestMapping("/birthdays")
	@ResponseBody
	public List<Map<String, Object>> getBirthdays() {
		
		List<User> users = userDao.getAllUser(); // 모든 사용자 가져오기
		List<Map<String, Object>> birthdays = new ArrayList<>();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd"); //날짜형식지정
		
		for(User user : users) {
			if (user.getBirth() != null) { // 생일이 null이 아닐 경우에만 처리
                Map<String, Object> birthdayEvent = new HashMap<>();
                // 현재 연도와 사용자의 생일에서 월과 일을 조합
                String birthday = sdf.format(user.getBirth());
                birthdayEvent.put("title", user.getUsername() + "님 생일");
                birthdayEvent.put("start", "2024-" + birthday); // 포맷팅된 생일 추가
                birthdays.add(birthdayEvent);
            }
		}
		return birthdays;
	}
	
	
}
