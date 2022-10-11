package kr.sunrise.spring.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BusinessMemberVO extends MemberVO {
	private String bm_me_id;
	private String bm_number;
	private int bm_pos='0';
	
}
