package com.kh.oceanclass.common.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class AdminStatistics {

	private int staNo;
	private String staDate;
	private int newMem;
	private int sleepMem;
	private int delMem;
	private int newTeacher;
	private int sleepTeacher;
	private int delTeacher;
	
}
