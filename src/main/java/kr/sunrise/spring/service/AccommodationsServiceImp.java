package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.dao.AccommodationsDAO;
import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.FloorMapVO;
import kr.sunrise.spring.vo.RoomVO;
import kr.sunrise.spring.vo.SpecVO;

@Service
public class AccommodationsServiceImp implements AccommodationsService{

	@Autowired
	AccommodationsDAO accommodationsDao;
	@Autowired
	FileService fileService;
	
	@Override
	public void insertAccommodations(AccommodationsVO accommodations,MultipartFile[] floorImgs, MultipartFile [] files, int[] floors) {
		if(accommodations == null || files == null)
			return;
		
		accommodationsDao.insertAccommodations(accommodations);
		try {
			//층별 안내도 업로드
			fileService.insertFiles(files, "accommodations", accommodations.getAc_num());
			if(floorImgs == null || floorImgs.length == 0)
				return;
			for(int i = 0; i<floorImgs.length; i++) {
																		
				FileVO fileVo = fileService.insertFiles(floorImgs[i], "accommodations", accommodations.getAc_num());
				if(fileVo == null)
					continue;
				FloorMapVO floorMap = new FloorMapVO(accommodations.getAc_num(), fileVo.getFi_num(), floors[i]);
				accommodationsDao.insertFloorMap(floorMap);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
		
	}
	@Override
	public ArrayList<AccommodationsVO> getAccommodationsList(Criteria cri) {
		if(cri == null)
			cri = new Criteria();
		return accommodationsDao.selectAccommodationsList(cri);
	}
	@Override
	public int getAccommodationsTotalCount(Criteria cri) {
		if(cri == null)
			cri = new Criteria();
		return accommodationsDao.selectAccommodationsTotalCount(cri);
	}
	@Override
	public AccommodationsVO getAccommodations(Integer ac_num) {
		if(ac_num == null)
			return null;
		return accommodationsDao.selectAccommodations(ac_num);
	}
	@Override
	public ArrayList<FileVO> getFileList(String fi_ta_name, Integer fi_same_num) {
		if(fi_ta_name == null || fi_ta_name.length() == 0 || fi_same_num == null)
			return null;
		return fileService.selectFileList(fi_ta_name, fi_same_num);
	}
	@Override
	public AccommodationsVO getAccommodations(String ac_name) {
		if(ac_name == null)
			return null;
		return accommodationsDao.selectAccommodationsName(ac_name);
	}
	//객실 추가 메소드
	@Override
	public void insertRoom(RoomVO room, SpecVO spec, MultipartFile[] files) {
		if(room == null || spec == null || files == null)
			return;
		String isPremium = isPremium(spec);
		room.setRo_premium(isPremium);
		//객실 업로드
		accommodationsDao.insertRoom(room);
		//스펙 테이블의 sp_ro_code에 객실 기본키값을 넣어줌
		spec.setSp_ro_code(room.getRo_code());
		
		accommodationsDao.insertSpec(spec);
		
		//객실이미지업로도
		fileService.insertFiles(files, "room", room.getRo_code());
	}
	//객실 프리미엄여부 확인해주는 메소드
	private String isPremium(SpecVO spec) {
		//화장실, 샤워실, 보일러, 에어컨, 창문 입니다.
		if(spec.getSp_bathroom().equals("N"))
			return "N";
		if(spec.getSp_shower().equals("N"))
			return "N";
		if(spec.getSp_hit().equals("N"))
			return "N";
		if(spec.getSp_ac().equals("N"))
			return "N";
		if(spec.getSp_window().equals("N"))
			return "N";
		if(spec.getSp_wifi().equals("N"))
			return "N";
		return "P";
	}
	@Override
	public ArrayList<FloorMapVO> getMapList(Integer ac_num) {
		if(ac_num == null)
			return null;
		return accommodationsDao.selectMapList(ac_num);
	}
	@Override
	public ArrayList<RoomVO> getRoomList(Integer ac_num) {
		if(ac_num == null)
			return null;
		return accommodationsDao.selectRoomList(ac_num);
	}
	
}
