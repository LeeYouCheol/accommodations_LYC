package kr.sunrise.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.AdvertiseVO;
import kr.sunrise.spring.vo.BuisnessInfoVO;

public interface AdminDAO {

	int insertInfo(BuisnessInfoVO info);

	ArrayList<BuisnessInfoVO> selectInfoList(@Param("cri")Criteria cri, @Param("bi_title")String bi_title);

	int selectInfoTotalCount(@Param("cri")Criteria cri, @Param("bi_title")String bi_title);

	BuisnessInfoVO selectInfo(Integer bi_num);

	int updateInfo(BuisnessInfoVO dbInfo);

	boolean signAdvertise(AdvertiseVO advertise);

	AdvertiseVO selectContract(String ad_code);

	ArrayList<AdvertiseVO> selectAdList(AdvertiseVO advertise);

	ArrayList<AdvertiseVO> selectAdvertiseListMy(String me_id);

	void updateAdSatePermit(AdvertiseVO advertise);

	void updateAdSateCancel(AdvertiseVO advertise);

}
