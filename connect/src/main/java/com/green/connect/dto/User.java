package com.green.connect.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	
	private String username;
	private String password;
	private String name;
	private String role;
	private String email;
	private String tel;
	private String birth;
	
	private int levelno;
	
}
