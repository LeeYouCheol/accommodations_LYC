package kr.sunrise.spring.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {

	private int qu_num;
	private String qu_title;
	private String qu_me_id;
	private Date qu_date;
	private String qu_where;
	private String qu_content;
	private String qu_secret = "0";
	private String qu_type;
	private int qu_ori_num;
	
	public String getQu_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(qu_date);
	}
}
