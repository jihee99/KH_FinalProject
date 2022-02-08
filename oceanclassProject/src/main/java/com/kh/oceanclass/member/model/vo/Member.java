package com.kh.oceanclass.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Member {
	
	private int mNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String nickName;
	private String phone;
	private String profileImg;
	private String point;
	private String grade;
	private String uStatus;
	private String report;
	private Date enrollDate;
	private Date sleepDate;
	private Date escapeDate;
	
}
