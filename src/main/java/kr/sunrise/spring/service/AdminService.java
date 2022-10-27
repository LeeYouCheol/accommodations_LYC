package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.AdvertiseVO;
import kr.sunrise.spring.vo.BuisnessInfoVO;
import kr.sunrise.spring.vo.MemberVO;

public interface AdminService {

	boolean insertInfo(BuisnessInfoVO info, MemberVO user);
	
	boolean insertInfo(BuisnessInfoVO info, MemberVO user, MultipartFile[] files);

	ArrayList<BuisnessInfoVO> getInfoList(Criteria cri, String bi_title);

	int getInfoTotalCount(Criteria cri, String bi_title);

	BuisnessInfoVO getInfo(Integer bi_num);

	boolean isWriter(BuisnessInfoVO info, MemberVO user);
	
	boolean updateInfo(BuisnessInfoVO info, MemberVO user);

	boolean updateInfo(BuisnessInfoVO info, MemberVO user, MultipartFile[] files, int[] nums);

	boolean signAdvertise(AdvertiseVO advertise);

	AdvertiseVO getAdvertise(String ad_code);

	ArrayList<AdvertiseVO> getAdList(AdvertiseVO advertise);

	ArrayList<AdvertiseVO> getAdvertiseListMy(MemberVO user);

	boolean updateAdSatePermit(AdvertiseVO advertise);

	boolean updateAdSateCancel(AdvertiseVO advertise);

}
