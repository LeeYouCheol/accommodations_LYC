package kr.sunrise.spring.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.vo.BusinessMemberVO;
import kr.sunrise.spring.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(String me_id);

	void insertMember(MemberVO member);

	void updatePos(@Param("me_id")String me_id, @Param("me_pos")String me_pos);

	void updatePosCount(String me_email);

	void insertBusinessMember(MemberVO member);

	void updateMemberSession(@Param("me_id")String me_id, @Param("me_s_id")String me_s_id, @Param("me_s_limit")Date me_s_limit);

	MemberVO selectMemberBySession(String me_s_id);

	ArrayList<String> selectIdList(@Param("m")MemberVO member);

	MemberVO selectMemberByIdEmail(@Param("m")MemberVO member);

	void updateMember(MemberVO Member);

	ArrayList<BusinessMemberVO> selectBmList(BusinessMemberVO bm);

	void updatePosPermit(BusinessMemberVO bm);

	void updatePosCancel(BusinessMemberVO bm);

	BusinessMemberVO selectBusinessmember(MemberVO user);
}
