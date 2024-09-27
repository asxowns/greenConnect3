package com.green.connect.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	
	private int bno;
	private String title;
	private String content;
	private String etc;
	private int categoryNo;
	private Date regDate;
	private int view;
	
	private String username;

	public Board(String title, String content, int categoryNo, Date now, int view, String username) {
		super();
		this.title = title;
		this.content = content;
		this.categoryNo = categoryNo;
		this.regDate = now;
		this.view = view;
		this.username = username;
	}
	
	
}
