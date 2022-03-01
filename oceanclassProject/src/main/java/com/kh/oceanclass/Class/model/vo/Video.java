package com.kh.oceanclass.Class.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Video {
	
	private int clNo;
	private int videoNo;
	private String category;
	private String clName;
	private String chapter;
	private String subChapter;
	private String videoAddress;
	
}
