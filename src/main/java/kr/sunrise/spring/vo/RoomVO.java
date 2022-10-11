package kr.sunrise.spring.vo;

import java.text.DecimalFormat;

import lombok.Data;

@Data
public class RoomVO {
	private int ro_code;
	private int ro_ac_num;
	private int ro_floor;
	private String ro_type;
	private String ro_num;
	private String ro_content;
	private int ro_price;
	private String ro_premium="N";
	private String ro_State="A";
	
	public String getRo_price_str() {
		if(ro_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(ro_price) + "원";
	}
}
