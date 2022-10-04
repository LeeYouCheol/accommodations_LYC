package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.dao.QnaDAO;
import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.utils.UploadFileUtils;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.QuestionVO;

@Service
public class QnaServiceImp implements QnaService{

	@Autowired
	QnaDAO qnaDao;
	
	@Autowired
	FileService fileService;
	
	String uploadPath = "C:\\Users\\LYC\\Documents\\GIT\\uploadfiles";

	@Override
	public boolean insertQuestion(QuestionVO question, MemberVO user, String qu_type) {
		if(question == null ||
				question.getQu_title() == null ||
				question.getQu_title().length() == 0 ||
				question.getQu_content() == null)
			return false;
		if(user == null)
			return false;
		question.setQu_me_id(user.getMe_id());
		question.setQu_type(qu_type);
		return qnaDao.insertQuestion(question) == 1 ? true : false;
	}
	@Override
	public boolean insertQuestion(QuestionVO question, MemberVO user, MultipartFile[] files) {
		if(question == null || question.getQu_type() == null || question.getQu_where() == null)
			return false;
		
		boolean res = insertQuestion(question, user, question.getQu_where());
		
		if(!res)
			return false;
		
		fileService.insertFiles(files, "question", question.getQu_num());
		return true;
	}
	//QnA 리스트 불러오는 메소드
	@Override
	public ArrayList<QuestionVO> getQuestionList(Criteria cri, String qu_where) {
		if(qu_where == null)
			qu_where = "";
		if(cri == null)
			cri = new Criteria();
		
		return qnaDao.selectQuestionList(cri,qu_where);
	}
	//QnA 토탈카운트
	@Override
	public int getQuestionTotalCount(Criteria cri, String qu_where) {
		if(qu_where == null)
			qu_where = "";
		if(cri == null)
			cri = new Criteria();
		return qnaDao.selectQuestionTotalCount(cri,qu_where);
	}
	@Override
	public QuestionVO getQuestion(Integer qu_num) {
		if(qu_num == null)
			return null;
		return qnaDao.selectQuestion(qu_num);
	}
	
	@Override
	public boolean isWriter(QuestionVO question, MemberVO user) {
		if(question == null || user == null)
			return false;
		return question.getQu_me_id().equals(user.getMe_id());
	}
	@Override
	public boolean updateQestion(QuestionVO question, MemberVO user) {
		if(question == null ||
				question.getQu_title() == null ||
				question.getQu_title().length() == 0 ||
				question.getQu_content() == null)
			return false;
		QuestionVO dbQuestion = qnaDao.selectQuestion(question.getQu_num());
		if(dbQuestion == null)
			return false;

		if(user.getMe_authority() != 10 && !dbQuestion.getQu_me_id().equals(user.getMe_id()))
			return false;
		
		dbQuestion.setQu_title(question.getQu_title());
		dbQuestion.setQu_content(question.getQu_content());
		return qnaDao.updateQuestion(dbQuestion) == 1 ? true : false;
	}
	@Override
	public boolean updateQuestion(QuestionVO question, MemberVO user, MultipartFile[] files, int[] nums) {
		if(user == null || question == null)
			return false;
		//기존 qna정보를 가져옴(기본키를 이용)
		QuestionVO dbQuestion = qnaDao.selectQuestion(question.getQu_num());
		//기존 qna가 존재하는 확인하여 없으면 false 리턴
		if(dbQuestion == null)
			return false;
		//기존 qna 작성자와 user의 아이디와 같은지 확인, 다르면 false를 리턴
		if(!dbQuestion.getQu_me_id().equals(user.getMe_id()))
			return false;
		int res = qnaDao.updateQuestion(question);
		if(res != 1)
			return false;
		if(nums != null && nums.length != 0) {
			for(int fi_num : nums) {
				FileVO fileVo = qnaDao.selectFile(fi_num);
				if(fileVo == null || fileVo.getFi_same_num() != question.getQu_num())
					continue;
				fileService.deleteFile(fileVo);
			}
		}
		fileService.insertFiles(files,"question", question.getQu_num());
		return true;
	}
	
	
	//QnA삭제
	@Override
	public boolean deleteQuestion(Integer qu_num, MemberVO user, String fi_ta_name, int fi_same_num) {
		if(qu_num == null || user == null)
			return false;
		QuestionVO question = qnaDao.selectQuestion(qu_num);
		if(question == null)
			return false;
		if(user.getMe_authority() != 10 && !question.getQu_me_id().equals(user.getMe_id()))
			return false;
		
		ArrayList<FileVO> fileList = fileService.selectFileList(fi_ta_name, fi_same_num);
		if(fileList != null && fileList.size() != 0) {
			for(FileVO fileVo : fileList) {
				fileService.deleteFile(fileVo);	
			}
		}
		int res = qnaDao.deleteQuestion(qu_num);
		return res == 1 ? true : false;
	}
	
	
}
