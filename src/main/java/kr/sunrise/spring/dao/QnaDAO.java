package kr.sunrise.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.QuestionVO;

public interface QnaDAO {

	int insertQuestion(QuestionVO question);

	ArrayList<QuestionVO> selectQuestionList(@Param("cri")Criteria cri, @Param("qu_where")String qu_where);

	void insertFile(FileVO fileVo);

	int selectQuestionTotalCount(@Param("cri")Criteria cri, @Param("qu_where")String qu_where);

	QuestionVO selectQuestion(Integer qu_num);

	
	
	FileVO selectFile(int fi_num);
	
	void deleteFile(int fi_num);

	int deleteQuestion(Integer qu_num);

	int updateQuestion(QuestionVO Question);
	
}
