package kr.sunrise.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.FloorMapVO;
import kr.sunrise.spring.vo.RoomVO;

public interface AccommodationsDAO {

	void insertAccommodations(AccommodationsVO accomodations);

	ArrayList<AccommodationsVO> selectAccommodationsList(Criteria cri);

	int selectAccommodationsTotalCount(Criteria cri);

	AccommodationsVO selectAccommodations(Integer ac_num);

	void insertFloorMap(FloorMapVO floorMap);

	AccommodationsVO selectAccommodationsName(String ac_name);

	void insertRoom(RoomVO room);

	void insertSpec(RoomVO room);

	ArrayList<FloorMapVO> selectMapList(@Param("ac_num")Integer ac_num);

	ArrayList<RoomVO> selectRoomList(Integer ac_num);
}
