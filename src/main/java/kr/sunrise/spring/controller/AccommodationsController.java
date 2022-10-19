package kr.sunrise.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.pagination.PageMaker;
import kr.sunrise.spring.service.AccommodationsService;
import kr.sunrise.spring.service.FileService;
import kr.sunrise.spring.service.MemberService;
import kr.sunrise.spring.service.MessageService;
import kr.sunrise.spring.service.NoticeService;
import kr.sunrise.spring.service.QnaService;
import kr.sunrise.spring.service.ReviewService;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.ContractVO;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.FloorMapVO;
import kr.sunrise.spring.vo.NoticeVO;
import kr.sunrise.spring.vo.QuestionVO;
import kr.sunrise.spring.vo.ReviewVO;
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
	ReviewService reviewService;
	@Autowired
	MessageService messageService;
	@Autowired
	FileService fileService;
	
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
	public ModelAndView accommodationsListGet(ModelAndView mv, Criteria cri) {
		ArrayList<AccommodationsVO> list = accommodationsService.getAccommodationsList(cri);
		int totalCount = accommodationsService.getAccommodationsTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.setViewName("/accommodations/list");
		return mv;
	}
    //객실수정
    @RequestMapping(value="/accommodations/update", method = RequestMethod.GET)
    public ModelAndView accommodationsUpdateGet(ModelAndView mv, Integer ac_num) {
    	AccommodationsVO accommodations = accommodationsService.getAccommodations(ac_num);
    	ArrayList<FileVO> fileList = fileService.selectFileList("accommodations", ac_num);
    	
    	mv.addObject("accommodations", accommodations);
    	mv.addObject("fileList", fileList);
    	mv.setViewName("/accommodations/update");
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
    //객실 목록
    @RequestMapping(value="/room/list", method = RequestMethod.GET)
    public ModelAndView roomListGet(ModelAndView mv, int ac_num) {
    	//고시원에 해당하는 객실이미지
    	ArrayList<FileVO> roomFileList = accommodationsService.getRoomFileList(ac_num);
    	//해당 고시원의 객실정보
    	ArrayList<RoomVO> roomList = accommodationsService.getRoomList(ac_num);
    	
    	mv.addObject("roomFileList", roomFileList);
    	mv.addObject("roomList", roomList);
    	mv.setViewName("/room/list");
        return mv;
    }
    //객실 상세보기
    @RequestMapping(value = "/room/select/{ro_code}", method = RequestMethod.GET)
   	public ModelAndView roomSelectGet(ModelAndView mv, @PathVariable("ro_code")Integer ro_code) {
    	//해당 고시원의 객실정보
    	RoomVO room = accommodationsService.getRoom(ro_code);
    	//고시원에 해당하는 객실이미지
    	ArrayList<FileVO> fileList = fileService.selectFileList("room", ro_code);

   		mv.addObject("room", room);
   		mv.addObject("fileList", fileList);
   		mv.setViewName("/room/select");
   		return mv;
   	}
    //객실수정
    @RequestMapping(value="/room/update/{ro_code}", method = RequestMethod.GET)
    public ModelAndView roomUpdateGet(ModelAndView mv, @PathVariable("ro_code")Integer ro_code,
    		Integer ac_num) {
    	AccommodationsVO accommodations = accommodationsService.getAccommodations(ac_num);
    	RoomVO room = accommodationsService.getRoom(ro_code);
    	SpecVO spec = accommodationsService.getSpec(ro_code);
    	ArrayList<FileVO> fileList = fileService.selectFileList("room", ro_code);
    	
    	mv.addObject("accommodations", accommodations);
    	mv.addObject("room", room);
    	mv.addObject("spec", spec);
    	mv.addObject("fileList", fileList);
    	mv.setViewName("/room/update");
        return mv;
    }
    @RequestMapping(value = "/room/update/{ro_code}", method = RequestMethod.POST)
	public ModelAndView boardUpdatePost(ModelAndView mv, @PathVariable("ro_code")Integer ro_code, RoomVO room,
			MultipartFile []files, HttpServletResponse response, int[]nums) {
		boolean res = accommodationsService.updateRoom(room, files, nums);
		if(res)
			messageService.message(response, "객실을 수정했습니다.", "/room/select?ro_code="+room.getRo_code());
		else
			messageService.message(response, "객실 수정에 실패했습니다.", "/room/select?ro_code="+room.getRo_code());
		return mv;
	}
    //고시원 상세보기
    @RequestMapping(value = "/accommodations/select/{ac_num}", method = RequestMethod.GET)
   	public ModelAndView accommodationsSelectGet(ModelAndView mv, 
   			@PathVariable("ac_num")Integer ac_num, String no_where, String qu_where,
   			Criteria cri, Integer re_num) {
    	//고시원 정보
    	AccommodationsVO accommodations = accommodationsService.getAccommodations(ac_num);
    	//해당 고시원에 해당하는 파일.상세이미지.
    	ArrayList<FileVO> fileList = accommodationsService.getFileList("accommodations", ac_num);
    	//해당 고시원의 층별 이미지
    	ArrayList<FloorMapVO> mapList = accommodationsService.getMapList(ac_num);
    	//해당 고시원의 객실정보
    	ArrayList<RoomVO> roomList = accommodationsService.getRoomList(ac_num);
    	//고시원에 해당하는 객실이미지
    	ArrayList<FileVO> roomFileList = accommodationsService.getRoomFileList(ac_num);
    	//공지사항 리스트 가져오기
    	ArrayList<NoticeVO> noticeList = noticeService.getNoticeList(cri, no_where);
    	//QnA리스트 가져오기
    	ArrayList<QuestionVO> qnaList = qnaService.getQuestionList(cri, qu_where);
    	//리뷰목록
    	ArrayList<ReviewVO> reviewList = reviewService.getReviewList(cri, ac_num);
    	//리뷰 사진파일 가져오기
    	ArrayList<FileVO> reviewFileList = accommodationsService.getReviewFileList(ac_num);
    	
    	mv.addObject("accommodations", accommodations);
   		mv.addObject("fileList", fileList);
   		mv.addObject("mapList", mapList);
   		mv.addObject("roomList", roomList);
   		mv.addObject("roomFileList", roomFileList);
   		mv.addObject("noticeList", noticeList);
   		mv.addObject("qnaList", qnaList);
   		mv.addObject("reviewList", reviewList);
   		mv.addObject("reviewFileList", reviewFileList);
   		mv.setViewName("/accommodations/select");
   		return mv;
   	}
    //계약 진행
    @RequestMapping(value="/accommodations/contract/{ro_code}", method = RequestMethod.GET)
    public ModelAndView contractGet(ModelAndView mv, @PathVariable("ro_code")Integer ro_code,
    		Integer ac_num) {
    	//고시원 정보
    	AccommodationsVO accommodations = accommodationsService.getAccommodations(ac_num);
    	//해당 고시원의 객실정보
    	RoomVO room = accommodationsService.getRoom(ro_code);
    	
    	mv.addObject("accommodations", accommodations);
    	mv.addObject("room", room);
    	mv.setViewName("/accommodations/contract");
        return mv;
    }
    //ajax
  	@ResponseBody
    @RequestMapping(value="/accommodations/contract/{ro_code}", method = RequestMethod.POST)
    public  Map<Object,Object> completePost(@RequestBody ContractVO contract, RoomVO room) {
  		HashMap<Object,Object> map = new HashMap<Object, Object>();
  		boolean res = accommodationsService.signContract(contract);
  		boolean state = accommodationsService.updateStateContract(room);
  		
  		map.put("res",res);
  		map.put("state", state);
          return map;
      }
  	//결재후 출력될 페이지
    @RequestMapping(value="/accommodations/complete", method = RequestMethod.GET)
    public ModelAndView completeGet(ModelAndView mv, String co_num) {
    	ContractVO contract = accommodationsService.getContract(co_num);
    	
    	mv.addObject("contract", contract);
    	mv.setViewName("/accommodations/complete");
        return mv;
    }
    //수리 버튼 ajax
    @RequestMapping(value= "/room/state/fix", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxStateFix(@RequestBody RoomVO room) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = accommodationsService.updateRoomState(room);
		map.put("res", res);
		return map;
	}
    //수리끝, 사용가능 상태로 변경하는 ajax
    @RequestMapping(value= "/room/state/use", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxStateUse(@RequestBody RoomVO room) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = accommodationsService.updateRoomState(room);
		map.put("res", res);
		return map;
	}
}
