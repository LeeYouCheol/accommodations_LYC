package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.dao.FileDAO;
import kr.sunrise.spring.utils.UploadFileUtils;
import kr.sunrise.spring.vo.FileVO;

@Service
public class FileServiceImp implements FileService{

	@Autowired
	FileDAO fileDao;
	
	String uploadPath = "C:\\Users\\LYC\\Documents\\GIT\\uploadfiles";
	
	//첨부파일 업로드 메소드
	public void insertFiles(MultipartFile[] files, String fi_ta_name, int fi_same_num) {
		if(files == null || files.length == 0)
			return ;
		for(MultipartFile file : files) {
			insertFiles(file, fi_ta_name, fi_same_num);
		}
	}
	public void deleteFile(FileVO fileVo) {
		if(fileVo == null)
			return;
		UploadFileUtils.deleteFile(uploadPath, fileVo.getFi_name());
		fileDao.deleteFile(fileVo.getFi_num());
	}
	@Override
	public ArrayList<FileVO> selectFileList(String fi_ta_name, int fi_same_num) {
		if(fi_ta_name == null || fi_ta_name.length() == 0)
			return null;
		return fileDao.selectFileList(fi_ta_name, fi_same_num);
	}
	//첨부파일 업로드 메소드
	public FileVO insertFiles(MultipartFile file, String fi_ta_name, int fi_same_num) {
		if(file == null || file.getOriginalFilename().length() == 0)
			return null;
		
		try {
			String fi_name = UploadFileUtils.uploadFileUUID(uploadPath, file.getOriginalFilename(), file.getBytes());
			FileVO fileVo = new FileVO(fi_name, file.getOriginalFilename(), fi_ta_name, fi_same_num);
			fileDao.insertFile(fileVo);
			return fileVo;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
