package kr.sunrise.spring.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private int re_num;
	private String re_co_num;
	private String re_me_id;
	private String re_content;
	private Date re_reg_date;
	private String re_thumb; //sql에는 없지만 vo에는 있어야한다.
	
	public String getRe_reg_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(re_reg_date);
	}
}
