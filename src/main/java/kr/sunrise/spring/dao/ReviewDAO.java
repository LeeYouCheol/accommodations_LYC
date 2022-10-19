package kr.sunrise.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.ReviewVO;

public interface ReviewDAO {

	int insertReview(ReviewVO review);

	ArrayList<ReviewVO> selectReviewList(@Param("cri")Criteria cri, @Param("ac_num")Integer ac_num);

}
