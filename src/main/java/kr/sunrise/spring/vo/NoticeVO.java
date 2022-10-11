package kr.sunrise.spring.vo;

import java.text.SimpleDateFormat;
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
	
	public String getNo_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(no_date);
	}
}
