package kr.sunrise.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {

	private int no_num;
	private String no_where;
	private String no_title;
	private String no_me_id;
	private Date no_date;
	private String no_content;
}
