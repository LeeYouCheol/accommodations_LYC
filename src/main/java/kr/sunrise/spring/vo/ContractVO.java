package kr.sunrise.spring.vo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ContractVO {

	private String co_num;
	private String co_ac_name;
	private int co_ro_code;
	private String co_ro_num;
	private String co_me_id;
	private String co_me_rn;
	private String co_me_name;
	private String co_me_phone;
	private int co_month;
	private int co_price;
	private Date co_sign_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date co_enter_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date co_exite_date;
	private int co_ac_num;
	private String co_state="C";
	
	//계약일 날자변환
	public String getCo_sign_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(co_sign_date);
	}
	//입실일 날자변환
	public String getCo_enter_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(co_enter_date);
	}
	//퇴실일 날자변환
	public String getCo_exite_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(co_exite_date);
	}
	public String getCo_price_str() {
		if(co_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(co_price) + "원";
	}
}
