package kr.sunrise.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.ContractVO;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.FloorMapVO;
import kr.sunrise.spring.vo.RoomVO;
import kr.sunrise.spring.vo.SpecVO;

public interface AccommodationsDAO {

	void insertAccommodations(AccommodationsVO accomodations);

	ArrayList<AccommodationsVO> selectAccommodationsList(@Param("cri")Criteria cri);

	int selectAccommodationsTotalCount(@Param("cri")Criteria cri);

	AccommodationsVO selectAccommodations(Integer ac_num);

	void insertFloorMap(FloorMapVO floorMap);

	AccommodationsVO selectAccommodationsName(String ac_name);

	void insertRoom(RoomVO room);

	void insertSpec(RoomVO room);

	ArrayList<FloorMapVO> selectMapList(@Param("ac_num")Integer ac_num);

	ArrayList<RoomVO> selectRoomList(Integer ac_num);

	ArrayList<FileVO> selectRoomFileList(Integer ac_num);

	RoomVO selectRoom(Integer ro_code);

	boolean signContract(ContractVO contract);

	ContractVO selectContract(String co_num);

	

	SpecVO selectSpec(Integer ro_code);

	void updateStateContract(RoomVO room);
	
	int updateRoom(RoomVO room);

	ArrayList<ContractVO> selectContractList(String me_id);
	
	void updateRoomState(RoomVO room);

	void updateAccPermit(AccommodationsVO accommodations);

	ArrayList<FileVO> selectReviewFileList(Integer ac_num);

	ContractVO selectcontractroom(Integer ro_code);

	ContractVO selectContractInfo(String co_num);

	RoomVO selectRoomExtend(Integer co_ro_code);

	boolean updateContractState(ContractVO contract);

	void updateRoomStateExite(RoomVO room);

}
