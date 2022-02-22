package com.kh.oceanclass.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Teacher {
	
	private int memNo;
	private String userId;
	private String tcHistory;
	private String tcIntroduce;
	private String tcSns;
	private String historyFile;
	
}
