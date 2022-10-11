package kr.sunrise.spring.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data //여기에 노란색 오류가 나오
@EqualsAndHashCode(callSuper=false)
public class SpecVO extends RoomVO{

	private int sp_ro_code;
	private String sp_bed="N";
	private String sp_table="N";
	private String sp_chair="N";
	private String sp_ac="N";
	private String sp_hit="N";
	private String sp_bathroom="N";
	private String sp_shower="N";
	private String sp_refrigerator="N";
	private String sp_window="N";
	private String sp_internet="N";
	private String Sp_wifi="N";
}
