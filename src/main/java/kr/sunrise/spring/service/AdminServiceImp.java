package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.dao.AdminDAO;
import kr.sunrise.spring.dao.FileDAO;
import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.AdvertiseVO;
import kr.sunrise.spring.vo.BuisnessInfoVO;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.MemberVO;

@Service
public class AdminServiceImp implements AdminService{

	@Autowired
	AdminDAO adminDao;
	@Autowired
	FileDAO fileDao;
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

	@Override
	public ArrayList<BuisnessInfoVO> getInfoList(Criteria cri, String bi_title) {
		if(cri == null)
			cri = new Criteria();
		return adminDao.selectInfoList(cri, bi_title);
	}

	@Override
	public int getInfoTotalCount(Criteria cri, String bi_title) {
		if(bi_title == null)
			bi_title = "";
		if(cri == null)
			cri = new Criteria();
		return adminDao.selectInfoTotalCount(cri,bi_title);
	}

	@Override
	public BuisnessInfoVO getInfo(Integer bi_num) {
		if(bi_num == null)
			return null;
		return adminDao.selectInfo(bi_num);
	}

	@Override
	public boolean isWriter(BuisnessInfoVO info, MemberVO user) {
		if(info == null || user == null)
			return false;
		return info.getBi_me_id().equals(user.getMe_id());
	}

	@Override
	public boolean updateInfo(BuisnessInfoVO info, MemberVO user) {
		if(info == null ||
				info.getBi_title() == null ||
				info.getBi_title().length() == 0 ||
				info.getBi_content() == null)
			return false;
		BuisnessInfoVO dbInfo = adminDao.selectInfo(info.getBi_num());
		if(dbInfo == null)
			return false;

		if(user.getMe_authority() != "M" && !dbInfo.getBi_me_id().equals(user.getMe_id()))
			return false;
		
		dbInfo.setBi_title(info.getBi_title());
		dbInfo.setBi_content(info.getBi_content());
		return adminDao.updateInfo(dbInfo) == 1 ? true : false;
	}

	@Override
	public boolean updateInfo(BuisnessInfoVO info, MemberVO user, MultipartFile[] files, int[] nums) {
		if(user == null || info == null)
			return false;
		//기존 qna정보를 가져옴(기본키를 이용)
		BuisnessInfoVO dbInfo = adminDao.selectInfo(info.getBi_num());
		//기존 qna가 존재하는 확인하여 없으면 false 리턴
		if(dbInfo == null)
			return false;
		//기존 qna 작성자와 user의 아이디와 같은지 확인, 다르면 false를 리턴
		if(!dbInfo.getBi_me_id().equals(user.getMe_id()))
			return false;
		int res = adminDao.updateInfo(info);
		if(res != 1)
			return false;
		if(nums != null && nums.length != 0) {
			for(int fi_num : nums) {
				FileVO fileVo = fileDao.selectFile(fi_num);
				if(fileVo == null || fileVo.getFi_same_num() != info.getBi_num())
					continue;
				fileService.deleteFile(fileVo);
			}
		}
		fileService.insertFiles(files,"info", info.getBi_num());
		return true;
	}

	@Override
	public boolean signAdvertise(AdvertiseVO advertise) {
		if(advertise == null)
			return false;
		return adminDao.signAdvertise(advertise);
	}

	@Override
	public AdvertiseVO getAdvertise(String ad_code) {
		if(ad_code == null)
			return null;
		return adminDao.selectContract(ad_code);
	}

	@Override
	public ArrayList<AdvertiseVO> getAdList(AdvertiseVO advertise) {
		if(advertise == null)
			return null;
		return adminDao.selectAdList(advertise);
	}

	@Override
	public ArrayList<AdvertiseVO> getAdvertiseListMy(MemberVO user) {
		if(user == null)
			return null;
		return adminDao.selectAdvertiseListMy(user.getMe_id());
	}

	@Override
	public boolean updateAdSatePermit(AdvertiseVO advertise) {
		if(advertise == null)
			return false;
		adminDao.updateAdSatePermit(advertise);
		return true;
	}

	@Override
	public boolean updateAdSateCancel(AdvertiseVO advertise) {
		if(advertise == null)
			return false;
		adminDao.updateAdSateCancel(advertise);
		return true;
	}

}
