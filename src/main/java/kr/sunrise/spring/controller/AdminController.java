package kr.sunrise.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.service.AccommodationsService;
import kr.sunrise.spring.service.MemberService;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.BusinessMemberVO;

@Controller
public class AdminController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	AccommodationsService accommodationsService;

	//홈페이지메소드
    @RequestMapping(value="/admin/mypage", method = RequestMethod.GET)
    public ModelAndView adminMypage(ModelAndView mv, Criteria cri, HttpSession session,
    		BusinessMemberVO bm) {
    	ArrayList<BusinessMemberVO> bmList = memberService.getBmList(bm);
    	ArrayList<AccommodationsVO> list = accommodationsService.getAccommodationsList(cri);
    	
    	mv.addObject("bmList", bmList);
    	mv.addObject("list", list);
		mv.setViewName("/admin/mypage");
        return mv;
    }
}
