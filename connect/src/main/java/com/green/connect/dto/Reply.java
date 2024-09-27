package com.green.connect.dto;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reply {
	
	private int rcode;
	private String replyContent;
	private Date replyDate;
	private String username;
	private int bno;
	
	private String name;
	private String formatDate;
	
	public Reply(String replyContent, Date replyDate, String username, int bno) {
		super();
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.username = username;
		this.bno = bno;
	}

	public Reply(int rcode, String replyContent, String username, int bno, String name, String formatDate) {
		super();
		this.rcode = rcode;
		this.replyContent = replyContent;
		this.username = username;
		this.bno = bno;
		this.name = name;
		this.formatDate = formatDate;
	}
	
	
	
	
}
