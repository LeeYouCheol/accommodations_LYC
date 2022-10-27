package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.QuestionVO;

public interface QnaService {

	boolean insertQuestion(QuestionVO question, MemberVO user, String qu_type);
	
	boolean insertQuestion(QuestionVO question, MemberVO user, MultipartFile[] files);
	
	ArrayList<QuestionVO> getQuestionList(Criteria cri, String qu_where);
	
	int getQuestionTotalCount(Criteria cri, String qu_where);
	
	QuestionVO getQuestion(Integer qu_num);
	
	

	boolean isWriter(QuestionVO question, MemberVO user);
	
	boolean updateQestion(QuestionVO question, MemberVO user);

	boolean updateQuestion(QuestionVO question, MemberVO user, MultipartFile[] files, int[] nums);

	boolean deleteQuestion(Integer qu_num, MemberVO user, String fi_ta_name, int fi_smae_num);

	ArrayList<QuestionVO> getQuestionListMy(Criteria cri, String qu_where, MemberVO user);
	
}
