package kr.sunrise.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.FileVO;

public interface AccommodationsDAO {

	void insertAccommodations(AccommodationsVO accomodations);

	ArrayList<AccommodationsVO> selectAccommodationsList(Criteria cri);

	int selectAccommodationsTotalCount(Criteria cri);

	AccommodationsVO selectAccommodations(Integer ac_num);

	ArrayList<FileVO> selectFileList(@Param("fi")String fi_ta_name, @Param("fi")Integer fi_same_num);

}
