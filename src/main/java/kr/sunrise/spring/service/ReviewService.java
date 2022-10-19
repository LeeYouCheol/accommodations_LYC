package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.ReviewVO;

public interface ReviewService {

	boolean insertReview(ReviewVO review, MemberVO user);
	
	boolean insertReview(ReviewVO review, MemberVO user, MultipartFile[] files);

	ArrayList<ReviewVO> getReviewList(Criteria cri, Integer ac_num);

}
