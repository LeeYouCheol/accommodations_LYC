package kr.sunrise.spring.service;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.BusinessMemberVO;
import kr.sunrise.spring.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	boolean checkId(MemberVO member);
	
	boolean sendEmail(String title, String content, String receiver);

	boolean emailActive(MemberVO member);

	boolean isUser(MemberVO member);
	
	MemberVO login(MemberVO member);
	
	void keepLogin(String me_id, String id, Date date);
	
	MemberVO autoLogin(String session_id);

	void logout(HttpServletRequest request, HttpServletResponse response);

	ArrayList<String> getIdList(MemberVO member);

	boolean findpw(MemberVO member);
	
	ArrayList<BusinessMemberVO> getBmList(BusinessMemberVO bm);
	
	void updateMember(MemberVO member, MemberVO user);

	boolean updatePosPermit(BusinessMemberVO bm);

	boolean updatePosCancel(BusinessMemberVO bm);

}
