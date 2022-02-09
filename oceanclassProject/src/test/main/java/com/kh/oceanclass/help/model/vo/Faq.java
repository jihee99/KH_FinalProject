package com.kh.oceanclass.help.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class Faq {
	
	public int faqNo;
	public int memNo;
	public String category;
	public String faqTitle;
	public String faqContent;
	public String createDate;
	public String status;

}
