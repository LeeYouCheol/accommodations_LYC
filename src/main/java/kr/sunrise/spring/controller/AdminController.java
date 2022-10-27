package kr.sunrise.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.pagination.PageMaker;
import kr.sunrise.spring.service.AccommodationsService;
import kr.sunrise.spring.service.AdminService;
import kr.sunrise.spring.service.FileService;
import kr.sunrise.spring.service.MemberService;
import kr.sunrise.spring.service.MessageService;
import kr.sunrise.spring.service.NoticeService;
import kr.sunrise.spring.service.QnaService;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.AdvertiseVO;
import kr.sunrise.spring.vo.BuisnessInfoVO;
import kr.sunrise.spring.vo.BusinessMemberVO;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.NoticeVO;
import kr.sunrise.spring.vo.QuestionVO;

@Controller
public class AdminController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	AccommodationsService accommodationsService;
	@Autowired
	MessageService messageService;
	@Autowired
	AdminService adminService;
	@Autowired
	QnaService qnaService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	FileService fileService;
	
	//운영자 마이페이지
    @RequestMapping(value="/admin/mypage", method = RequestMethod.GET)
    public ModelAndView adminMypage(ModelAndView mv, Criteria cri, HttpSession session,
    		MemberVO member, BusinessMemberVO bm, String qu_where, String no_where,
    		AdvertiseVO advertise) {
    	ArrayList<BusinessMemberVO> bmList = memberService.getBmList(bm);
    	ArrayList<AccommodationsVO> accList = accommodationsService.getAccommodationsList(cri);
    	ArrayList<QuestionVO> qnaList = qnaService.getQuestionList(cri, qu_where);
  		int totalCount = qnaService.getQuestionTotalCount(cri, qu_where);
  		ArrayList<NoticeVO> noticeList = noticeService.getNoticeList(cri, no_where);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		ArrayList<AdvertiseVO> adList = adminService.getAdList(advertise);
    	
    	mv.addObject("bmList", bmList);
    	mv.addObject("accList", accList);
    	mv.addObject("qnaList", qnaList);
    	mv.addObject("noticeList", noticeList);
  		mv.addObject("pm", pm);
  		mv.addObject("adList", adList);
		mv.setViewName("/admin/mypage");
        return mv;
    }
    //사업자회원 승인
    @RequestMapping(value= "/bm/pos/permit", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxBmPosPermit(@RequestBody BusinessMemberVO bm) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = memberService.updatePosPermit(bm);
		map.put("res", res);
		return map;
	}
    //사업자회원 거절
    @RequestMapping(value= "/bm/pos/cancel", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxBmPosCancel(@RequestBody BusinessMemberVO bm) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = memberService.updatePosCancel(bm);
		map.put("res", res);
		return map;
	}
    //고시원 등록 수락
    @RequestMapping(value= "/accommodations/permit/register", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxAccPermitRegister(@RequestBody AccommodationsVO accommodations) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = accommodationsService.updateAccPermit(accommodations);
		map.put("res", res);
		return map;
	}
  //고시원 등록 수락
    @RequestMapping(value= "/accommodations/permit/turn", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxAccPermitTurn(@RequestBody AccommodationsVO accommodations) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = accommodationsService.updateAccPermit(accommodations);
		map.put("res", res);
		return map;
	}
  //고시원 등록 수락
    @RequestMapping(value= "/accommodations/permit/refuse", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxAccPermitRefuse(@RequestBody AccommodationsVO accommodations) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = accommodationsService.updateAccPermit(accommodations);
		map.put("res", res);
		return map;
	}
    //사업자 이용정보페이지
    @RequestMapping(value="/admin/list", method = RequestMethod.GET)
    public ModelAndView adminInfo(ModelAndView mv, Criteria cri, String bi_title) {
    	ArrayList<BuisnessInfoVO> infoList = adminService.getInfoList(cri, bi_title);
    	int totalCount = adminService.getInfoTotalCount(cri, bi_title);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		
    	mv.addObject("infoList", infoList);
    	mv.addObject("bi_title", bi_title);
    	mv.addObject("pm", pm);
		mv.setViewName("/admin/list");
        return mv;
    }
    //사업자 이용페이지 등록
    @RequestMapping(value="/admin/insert", method = RequestMethod.GET)
    public ModelAndView adminInfoInsertGet(ModelAndView mv) {
 	
		mv.setViewName("/admin/insert");
        return mv;
    }
    @RequestMapping(value="/admin/insert", method = RequestMethod.POST)
    public ModelAndView adminInfoInsertPost(ModelAndView mv, BuisnessInfoVO info, HttpSession session,
			MultipartFile []files, HttpServletResponse response) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = adminService.insertInfo(info, user, files);
		if(res)
			messageService.message(response, "안내사항을 등록했습니다.", "/spring/admin/list");
		else
			messageService.message(response, "안내사항 등록에 실패했습니다.", "/spring/admin/list");
		return mv;
    }
    //사업자 이용페이지 등록
    @RequestMapping(value="/admin/select", method = RequestMethod.GET)
    public ModelAndView adminInfoselectGet(ModelAndView mv, Integer bi_num) {
    	BuisnessInfoVO info = adminService.getInfo(bi_num);
    	ArrayList<FileVO> fileList = fileService.selectFileList("buisnessinfo", bi_num);
    	
    	mv.addObject("info", info);
    	mv.addObject("fileList", fileList);
		mv.setViewName("/admin/select");
        return mv;
    }
    //사업자 이용페이지 수정
    @RequestMapping(value = "/admin/update", method = RequestMethod.GET)
	public ModelAndView adminUpdateGet(ModelAndView mv, Integer bi_num, HttpSession session,
			HttpServletResponse response, String fi_ta_name, Integer fi_same_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		BuisnessInfoVO info = adminService.getInfo(bi_num);
		ArrayList<FileVO> fileList = fileService.selectFileList("buisnessinfo", bi_num);
		
		mv.addObject("fileList", fileList);
		mv.addObject("info", info);
		if(adminService.isWriter(info,user)) {
		mv.setViewName("/admin/update");
		}else {
			messageService.message(response, "", "/spring/admin/select?bi_num="+bi_num);
		}
		return mv;
	}
    @RequestMapping(value = "/admin/update", method = RequestMethod.POST)
	public ModelAndView adminUpdatePost(ModelAndView mv, Integer bi_num, BuisnessInfoVO info, HttpSession session,
			MultipartFile []files, HttpServletResponse response, int[]nums) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = adminService.updateInfo(info, user, files, nums);
		if(res)
			messageService.message(response, "안내사항을 수정했습니다.", "/spring/admin/select?bi_num="+info.getBi_num());
		else
			messageService.message(response, "안내사항 수정에 실패했습니다.", "/spring/admin/select?bi_num="+info.getBi_num());
		return mv;
	}
    //광고신청
    @RequestMapping(value="/admin/adregister", method = RequestMethod.GET)
    public ModelAndView adminAdregister(ModelAndView mv, Integer ac_num, HttpSession session,
    		MemberVO member) {
    	MemberVO user = (MemberVO)session.getAttribute("user");
    	BusinessMemberVO bm = memberService.getBusinessmember(user);
    	AccommodationsVO accommodations = accommodationsService.getAccommodations(ac_num);
    	
    	mv.addObject("bm", bm);
    	mv.addObject("accommodations", accommodations);
		mv.setViewName("/admin/adregister");
        return mv;
    }
    //ajax
  	@ResponseBody
    @RequestMapping(value="/admin/adregister", method = RequestMethod.POST)
    public  Map<Object,Object> AdregisterPost(@RequestBody AdvertiseVO advertise) {
  		HashMap<Object,Object> map = new HashMap<Object, Object>();
  		boolean res = adminService.signAdvertise(advertise);
  		
  		map.put("res",res);
        return map;
    }
  	//결재후 출력될 페이지
    @RequestMapping(value="/admin/complete", method = RequestMethod.GET)
    public ModelAndView completeGet(ModelAndView mv, String ad_code) {
    	AdvertiseVO advertise = adminService.getAdvertise(ad_code);
    	
    	mv.addObject("advertise", advertise);
    	mv.setViewName("/admin/complete");
        return mv;
    }
    //고시원 등록 수락
    @RequestMapping(value= "/ad/state/permit", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxAdPermit(@RequestBody AdvertiseVO advertise) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = adminService.updateAdSatePermit(advertise);
		map.put("res", res);
		return map;
	}
  //고시원 등록 수락
    @RequestMapping(value= "/ad/state/cancel", method=RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> ajaxAdCancel(@RequestBody AdvertiseVO advertise) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		boolean res = adminService.updateAdSateCancel(advertise);
		map.put("res", res);
		return map;
	}
}
