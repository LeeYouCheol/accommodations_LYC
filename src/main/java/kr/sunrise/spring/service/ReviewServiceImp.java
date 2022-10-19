package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.dao.ReviewDAO;
import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.ReviewVO;

@Service
public class ReviewServiceImp implements ReviewService{

	@Autowired
	ReviewDAO reviewDao;
	@Autowired
	FileService fileService;
	
	@Override
	public boolean insertReview(ReviewVO review, MemberVO user) {
		if(review == null || review.getRe_content() == null)
			return false;
		if(user == null)
			return false;
		review.setRe_me_id(user.getMe_id());
		return reviewDao.insertReview(review) == 1 ? true : false;
	}
	//리뷰 파일업로드
	@Override
	public boolean insertReview(ReviewVO review, MemberVO user, MultipartFile[] files) {
		if(review == null)
			return false;
		
		boolean res = insertReview(review, user);
		
		if(!res)
			return false;
		fileService.insertFiles(files, "review", review.getRe_num());
		return true;
	}
	@Override
	public ArrayList<ReviewVO> getReviewList(Criteria cri, Integer ac_num) {
		if(ac_num == null)
			return null;
		return reviewDao.selectReviewList(cri, ac_num);
	}

}
