package kr.sunrise.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.pagination.PageMaker;
import kr.sunrise.spring.service.AccommodationsService;
import kr.sunrise.spring.service.MemberService;
import kr.sunrise.spring.service.MessageService;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.FloorMapVO;


@Controller
public class AccommodationsController {
	
	@Autowired
    MemberService memberService;
	@Autowired
	AccommodationsService accommodationsService;
	@Autowired
	MessageService messageService;
	
    //고시원 등록 신청
    @RequestMapping(value="/accommodations/insert", method = RequestMethod.GET)
    public ModelAndView accommodationsinsertGet(ModelAndView mv) {
        mv.setViewName("/accommodations/insert");
        return mv;
    }
    @RequestMapping(value = "/accommodations/insert", method = RequestMethod.POST)
	public ModelAndView accommodationsInsertPost(ModelAndView mv, AccommodationsVO accommodations,
			MultipartFile [] floorImgs, MultipartFile [] files,FloorMapVO floormap,
			HttpServletResponse response) {
    	accommodationsService.insertAccommodations(accommodations,floorImgs, files, floormap);
		messageService.message(response, "고시원 등록을 신청했습니다.", "/");
		return mv;
	}
    //고시원목록
    @RequestMapping(value = "/accommodations/list", method = RequestMethod.GET)
	public ModelAndView qnaListGet(ModelAndView mv, String ac_permit, Criteria cri) {
		ArrayList<AccommodationsVO> list = accommodationsService.getAccommodationsList(cri);
		int totalCount = accommodationsService.getAccommodationsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.setViewName("/accommodations/list");
		return mv;
	}
    //고시원 상세보기
    @RequestMapping(value = "/accommodations/select/{ac_num}", method = RequestMethod.GET)
   	public ModelAndView accommodationsSelectGet(ModelAndView mv, 
   			@PathVariable("ac_num") Integer ac_num, String fi_ta_name, Integer fi_same_num) {
    	AccommodationsVO accommodations = accommodationsService.getAccommodations(ac_num);
   		ArrayList<FileVO> fileList = accommodationsService.getFileList(fi_ta_name, fi_same_num);
   		mv.addObject("fileList", fileList);
   		mv.addObject("accommodations", accommodations);
   		mv.setViewName("/accommodations/select");
   		return mv;
   	}
    //객실등록메소드
    @RequestMapping(value="/room/insert", method = RequestMethod.GET)
    public ModelAndView roomInsertGet(ModelAndView mv) {
        mv.setViewName("/room/insert");
        return mv;
    }
    
}
