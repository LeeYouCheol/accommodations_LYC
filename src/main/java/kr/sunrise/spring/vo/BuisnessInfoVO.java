package kr.sunrise.spring.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class BuisnessInfoVO {

	private int bi_num;
	private String bi_me_id;
	private String bi_me_name;
	private String bi_title;
	private String bi_content;
	private Date bi_reg_date;
	
	public String getBi_reg_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(bi_reg_date);
	}
}
