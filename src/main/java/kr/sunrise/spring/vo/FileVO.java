package kr.sunrise.spring.vo;

import lombok.Data;

@Data
public class FileVO {
	private int fi_num;
	private String fi_ta_name;
	private String fi_name;
	private String fi_ori_name;
	private int fi_same_num;
	public FileVO(String fi_name, String fi_ori_name, String fi_ta_name, int fi_same_num) {
		this.fi_ta_name = fi_ta_name;
		this.fi_name = fi_name;
		this.fi_ori_name = fi_ori_name;
		this.fi_same_num = fi_same_num;
	}
	
}
