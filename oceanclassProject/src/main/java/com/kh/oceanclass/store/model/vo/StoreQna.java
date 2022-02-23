package com.kh.oceanclass.store.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class StoreQna {

	private int csQno;
	private int memNo;
	private int gbNo;
	private int referNo;
	private String title;
	private String content;
	private String createDate;
	private int pwd;
	private String filePath;
	private String status;
	private String answerContent;
	private Date answerDate;
	
	
}
