package com.green.connect.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LevelUp {
	
	private int levelno;
	private String levelName;
	private String levelIcon;
	private int rank;
	private String description;
}
