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
	private String memNo;
	private int gbNo;
	private int referNo;
	private String title;
	private String content;
	private String createDate;
	private String pwd;
	private String filePath;
	private String status;
	private String answerContent;
	private String answerDate;
	
	private String userId;
	private String productName;
	private String profile;
	private String category;
	private String pwdCk;
}
