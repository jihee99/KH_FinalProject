package com.kh.oceanclass.Class.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassQna {

	private int csQnaNo;
	private String memNo; // 리스트 불러올때는 작성자 닉네임으로 저장
	private int gbNo;
	private int referNo;
	private String title;
	private String content;
	private String createDate;
	private Integer pwd;
	private String filePath;
	private String status;
	private String answerContent;
	private String answerDate;
	
	private String filePathMessage;
	private String teacherNick;
	
	private String nickname;
	
	private String profile;
	
}
