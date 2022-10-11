package kr.sunrise.spring.vo;

import lombok.Data;

@Data
public class AccommodationsVO {

	private int ac_num;
	private String ac_name;
	private String ac_me_id;
	private String ac_representation;
	private String ac_phone;
	private String ac_post_code;
	private String ac_addr;
	private String ac_addr_detail;
	private int ac_to_room;
	private int ac_floor;
	private String ac_content;
	private String ac_thumb; //sql에는 없지만 vo에는 있어야한다.
	private String ac_permit="S";
	
}
