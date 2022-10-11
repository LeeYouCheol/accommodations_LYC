package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.NoticeVO;

public interface NoticeService {

	ArrayList<NoticeVO> getNoticeList(Criteria cri, String no_where);

	int getNoticeTotalCount(Criteria cri, String no_where);

	boolean insertNotice(NoticeVO notice, MemberVO user, String no_where);
	
	boolean insertNotice(NoticeVO notice, MemberVO user, MultipartFile[] files);

	NoticeVO getNotice(Integer no_num);

	boolean isWriter(NoticeVO notice, MemberVO user);
	
	boolean updateNotice(NoticeVO notice, MemberVO user);

	boolean updateNotice(NoticeVO notice, MemberVO user, MultipartFile[] files, int[] nums);

	boolean deleteNotice(Integer no_num, MemberVO user, String fi_ta_name, int fi_same_num);

}
