package com.green.connect.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Calendar {
	private int cno;
	private String schedule;
	private Date scheduleDate;
}
