package kr.sunrise.spring.vo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class AdvertiseVO {

	private String ad_code;
	private int ad_ac_num;
	private String ad_ac_name;
	private String ad_ac_representation;
	private String ad_me_id;
	private String ad_bm_me_id;
	private String ad_me_name;
	private String ad_bm_number;
	private String ad_me_rn;
	private String ad_me_phone;
	private int ad_month;
	private int ad_to_price;
	private Date ad_reg_date;
	private Date ad_start_date;
	private Date ad_end_date;
	private String ad_state="N";
	
	//계약일 날자변환
	public String getAd_reg_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ad_reg_date);
	}
	//시작일 날자변환
		public String getAd_start_date_str() {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			return format.format(ad_start_date);
		}
	//종료일 날자변환
	public String getAd_end_date_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(ad_end_date);
	}
	public String getAd_to_price_str() {
		if(ad_to_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(ad_to_price) + "원";
	}
}
