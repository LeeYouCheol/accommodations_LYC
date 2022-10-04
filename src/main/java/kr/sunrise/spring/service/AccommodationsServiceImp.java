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

@Service
public class AccommodationsServiceImp implements AccommodationsService{

	@Autowired
	AccommodationsDAO accommodationsDao;
	@Autowired
	FileService fileService;
	
	@Override
	public void insertAccommodations(AccommodationsVO accommodations,MultipartFile[] floorImgs, MultipartFile [] files, FloorMapVO floormap) {
		if(accommodations == null || files == null)
			return;
		
		accommodationsDao.insertAccommodations(accommodations);
		try {
			fileService.insertFiles(files, "accommodations", accommodations.getAc_num());
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
		if(fi_ta_name == null || fi_ta_name.length() == 0)
			if(fi_same_num == null)
				return null;
			return accommodationsDao.selectFileList(fi_ta_name, fi_same_num);
	}

}
