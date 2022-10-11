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
import kr.sunrise.spring.service.NoticeService;
import kr.sunrise.spring.service.QnaService;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.FloorMapVO;
import kr.sunrise.spring.vo.NoticeVO;
import kr.sunrise.spring.vo.QuestionVO;
import kr.sunrise.spring.vo.RoomVO;
import kr.sunrise.spring.vo.SpecVO;


@Controller
public class AccommodationsController {
	
	@Autowired
    MemberService memberService;
	@Autowired
	AccommodationsService accommodationsService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	QnaService qnaService;
	@Autowired
	MessageService messageService;
	
    //고시원 등록 신청
    @RequestMapping(value="/accommodations/insert", method = RequestMethod.GET)
    public ModelAndView accommodationsinsertGet(ModelAndView mv) {
        mv.setViewName("/accommodations/insert");
        return mv;
    }
    @RequestMapping(value = "/accommodations/insert", method = RequestMethod.POST)
	public ModelAndView accommodationsInsertPost(ModelAndView mv, 
			AccommodationsVO accommodations, int [] floor,
			MultipartFile [] floorImgs, MultipartFile [] files,
			HttpServletResponse response) {
    	accommodationsService.insertAccommodations(accommodations, floorImgs, files, floor);
		messageService.message(response, "고시원 등록을 신청했습니다.", "/spring/main/home");
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
    //객실등록메소드
    @RequestMapping(value="/room/insert", method = RequestMethod.GET)
    public ModelAndView roomInsertGet(ModelAndView mv, int ac_num) {
    	AccommodationsVO accommodations = accommodationsService.getAccommodations(ac_num);
    	mv.addObject("accommodations", accommodations);
    	mv.setViewName("/room/insert");
        return mv;
    }
    @RequestMapping(value = "/room/insert", method = RequestMethod.POST)
   	public ModelAndView roomInsertPost(ModelAndView mv, 
   			RoomVO room, SpecVO spec, MultipartFile [] files,
   			HttpServletResponse response) {
       	accommodationsService.insertRoom(room, spec, files);
   		messageService.message(response, "객실을 등록했습니다.", "/spring/member/mypage");
   		return mv;
   	}
  //고시원 상세보기
    @RequestMapping(value = "/accommodations/select/{ac_num}", method = RequestMethod.GET)
   	public ModelAndView accommodationsSelectGet(ModelAndView mv, 
   			@PathVariable("ac_num") Integer ac_num, String no_where, String qu_where, Criteria cri) {
    	//고시원 정보
    	AccommodationsVO accommodations = accommodationsService.getAccommodations(ac_num);
    	//해당 고시원의 객실정보
    	ArrayList<RoomVO> roomList = accommodationsService.getRoomList(ac_num);
    	//해당 고시원에 해당하는 파일.상세이미지.
    	ArrayList<FileVO> fileList = accommodationsService.getFileList("accommodations", ac_num);
   		//해당 고시원의 층별 이미지
    	ArrayList<FloorMapVO> mapList = accommodationsService.getMapList(ac_num);
    	//공지사항 리스트 가져오기
    	ArrayList<NoticeVO> noticeList = noticeService.getNoticeList(cri, no_where);
    	//QnA리스트 가져오기
    	ArrayList<QuestionVO> qnaList = qnaService.getQuestionList(cri, qu_where);
    	
    	mv.addObject("accommodations", accommodations);
    	mv.addObject("roomList", roomList);
   		mv.addObject("fileList", fileList);
   		mv.addObject("mapList", mapList);
   		mv.addObject("noticeList", noticeList);
   		mv.addObject("qnaList", qnaList);
   		mv.setViewName("/accommodations/select");
   		return mv;
   	}
}
