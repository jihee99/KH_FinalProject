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
	
	private int faqNo;
	private int memNo;
	private String category;
	private String faqTitle;
	private String faqContent;
	private String createDate;
	private String status;
	
	private String nickname;

}
