package com.kh.oceanclass.store.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class StoreReviewFile {
	
	private int fileNo; // 첨부파일번호
	private int reviewNo; // 리뷰번호
	private String orginName; // 원본파일명
	private String changeName; // 수정파일명
	private int fileLevel; //첨부파일레벨
	private Date upDate; // 업로드날짜
	private String filePath; //저장경로
	private String fileStatus; //상태값

}
