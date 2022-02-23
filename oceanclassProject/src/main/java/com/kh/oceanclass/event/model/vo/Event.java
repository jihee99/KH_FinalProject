package com.kh.oceanclass.event.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Event {

	private int eventNo;
	private int memNo;
	private String category;
	private String eventTitle;
	private String eventContent;
	private String createDate;
	private String status;
	private String tag;
	private String img;
	
	private int couponNo;
	private int maxCount;

}
