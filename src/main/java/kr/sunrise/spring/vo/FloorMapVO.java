package kr.sunrise.spring.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper=false)
@NoArgsConstructor
public class FloorMapVO extends FileVO {
	
	private int fm_num;
	private int fm_ac_num;
	private int fm_fi_num;
	private int fm_floor;
	
	public FloorMapVO(int fm_ac_num, int fm_fi_num, int fm_floor) {
		this.fm_ac_num = fm_ac_num;
		this.fm_fi_num = fm_fi_num;
		this.fm_floor = fm_floor;
	}
}
