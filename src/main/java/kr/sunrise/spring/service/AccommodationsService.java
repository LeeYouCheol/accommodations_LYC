package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.FloorMapVO;
import kr.sunrise.spring.vo.RoomVO;
import kr.sunrise.spring.vo.SpecVO;

public interface AccommodationsService {

	void insertAccommodations(AccommodationsVO accommodations, MultipartFile [] files, MultipartFile[] files2, int[] floor);

	ArrayList<AccommodationsVO> getAccommodationsList(Criteria cri);

	int getAccommodationsTotalCount(Criteria cri);

	AccommodationsVO getAccommodations(Integer ac_num);

	ArrayList<FileVO> getFileList(String fi_ta_name, Integer fi_same_num);

	AccommodationsVO getAccommodations(String ac_name);

	void insertRoom(RoomVO room, SpecVO spec, MultipartFile[] files);
	
	ArrayList<FloorMapVO> getMapList( Integer ac_num);

	ArrayList<RoomVO> getRoomList(Integer ac_num);

}
