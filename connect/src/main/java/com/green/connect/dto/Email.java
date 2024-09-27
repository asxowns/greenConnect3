package com.green.connect.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Email {

	private int eid;
	private String email;
	private String username;
	private String verificationCode;
	private LocalDateTime expirationTime;
	private boolean verified;

}
