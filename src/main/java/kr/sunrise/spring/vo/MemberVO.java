package kr.sunrise.spring.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String me_id;
	private String me_name;
	private String me_rn;
	private char me_gender;
	private String me_pw;
	private String me_email;
	private String me_post_code;
	private String me_addr;
	private String me_addr_detail;
	private String me_phone;
	private String me_job;
	private String me_s_id;
	private Date me_s_limit;
	private String me_code;
	private int me_pos;
	private int me_pos_count;
	private int me_authority;
	public boolean autoLogin;
}
