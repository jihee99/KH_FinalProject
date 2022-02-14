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
	
	public int eventNo;
	public int memNo;
	public String category;
	public String eventTitle;
	public String eventContent;
	public String createDate;
	public String status;
	public String tag;
	public String img;

	public int maxCount;

}
