package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.vo.FileVO;

public interface FileService {

	public void insertFiles(MultipartFile[] files, String fi_ta_name, int fi_same_num);
	
	public void deleteFile(FileVO fileVo);
	
	public ArrayList<FileVO> selectFileList(String fi_ta_name, int fi_same_num);
}
