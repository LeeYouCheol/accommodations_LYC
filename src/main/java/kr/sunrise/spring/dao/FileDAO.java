package kr.sunrise.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.vo.FileVO;

public interface FileDAO {
	void insertFile(FileVO fileVo);

	FileVO selectFile(int fi_num);
	
	void deleteFile(int fi_num);
	
	ArrayList<FileVO> selectFileList(@Param("fi_ta_name")String fi_ta_name, @Param("fi_same_num")Integer fi_same_num);
}
