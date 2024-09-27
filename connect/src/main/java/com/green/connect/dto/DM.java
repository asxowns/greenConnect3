package com.green.connect.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DM {

	private int dno;
	private String content;
	private Date date;
	private int state;
	private String reciveUser;

	private String sendUser;

}
