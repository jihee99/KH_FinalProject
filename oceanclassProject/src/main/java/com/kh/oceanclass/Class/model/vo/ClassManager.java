package com.kh.oceanclass.Class.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassManager {

	private int cpage;
	private Integer yclass;
	private Integer nclass;
	private String array;
	private String category;
	private String keyword;
	private String before;
	private String after;
	
	private String clNo;
	private int rpage;
}
