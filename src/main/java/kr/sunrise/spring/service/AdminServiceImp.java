package kr.sunrise.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.dao.AdminDAO;
import kr.sunrise.spring.vo.BuisnessInfoVO;
import kr.sunrise.spring.vo.MemberVO;

@Service
public class AdminServiceImp implements AdminService{

	@Autowired
	AdminDAO adminDao;
	@Autowired
	FileService fileService;
	
	String uploadPath = "C:\\Users\\LYC\\Documents\\GIT\\uploadfiles";

	@Override
	public boolean insertInfo(BuisnessInfoVO info, MemberVO user) {
		if(info == null ||
				info.getBi_title() == null ||
				info.getBi_title().length() == 0 ||
				info.getBi_content() == null)
			return false;
		if(user == null)
			return false;
		info.setBi_me_id(user.getMe_id());
		return adminDao.insertInfo(info) == 1 ? true : false;
	}

	@Override
	public boolean insertInfo(BuisnessInfoVO info, MemberVO user, MultipartFile[] files) {
		if(info == null)
			return false;
		
		boolean res = insertInfo(info, user);
		
		if(!res)
			return false;
		
		fileService.insertFiles(files, "buisnessinfo", info.getBi_num());
		return true;
	}
}
