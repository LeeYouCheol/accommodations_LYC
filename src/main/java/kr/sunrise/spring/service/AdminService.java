package kr.sunrise.spring.service;

import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.vo.BuisnessInfoVO;
import kr.sunrise.spring.vo.MemberVO;

public interface AdminService {

	boolean insertInfo(BuisnessInfoVO info, MemberVO user);
	boolean insertInfo(BuisnessInfoVO info, MemberVO user, MultipartFile[] files);

}
