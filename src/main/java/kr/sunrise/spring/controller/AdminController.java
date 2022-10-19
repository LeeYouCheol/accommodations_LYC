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
import kr.sunrise.spring.service.AccommodationsService;
import kr.sunrise.spring.service.AdminService;
import kr.sunrise.spring.service.MemberService;
import kr.sunrise.spring.service.MessageService;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.BuisnessInfoVO;
import kr.sunrise.spring.vo.BusinessMemberVO;
import kr.sunrise.spring.vo.MemberVO;

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
	
	//운영자 마이페이지
    @RequestMapping(value="/admin/mypage", method = RequestMethod.GET)
    public ModelAndView adminMypage(ModelAndView mv, Criteria cri, HttpSession session,
    		MemberVO member, BusinessMemberVO bm) {
    	ArrayList<BusinessMemberVO> bmList = memberService.getBmList(bm);
    	ArrayList<AccommodationsVO> list = accommodationsService.getAccommodationsList(cri);
    	
    	mv.addObject("bmList", bmList);
    	mv.addObject("list", list);
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
    @RequestMapping(value="/admin/info", method = RequestMethod.GET)
    public ModelAndView adminInfo(ModelAndView mv, BuisnessInfoVO info) {
    	
		mv.setViewName("/admin/info");
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
			messageService.message(response, "질문을 등록했습니다.", "/spring/admin/info");
		else
			messageService.message(response, "질문 등록에 실패했습니다.", "/spring/admin/info");
		return mv;
    }
}
