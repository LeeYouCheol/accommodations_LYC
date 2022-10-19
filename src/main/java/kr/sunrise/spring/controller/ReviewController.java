package kr.sunrise.spring.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.sunrise.spring.service.AccommodationsService;
import kr.sunrise.spring.service.FileService;
import kr.sunrise.spring.service.MessageService;
import kr.sunrise.spring.service.ReviewService;
import kr.sunrise.spring.vo.ContractVO;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.ReviewVO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	@Autowired
    FileService fileService;
	@Autowired
	MessageService messageService;
	@Autowired
	AccommodationsService accommodationsService;
	
    //리뷰 작성
    @RequestMapping(value = "/review/insert", method = RequestMethod.GET)
    public ModelAndView reviewInsertGet(ModelAndView mv, HttpSession session,
    		String co_num) {
    	ContractVO contract = accommodationsService.getContract(co_num);
    	
    	mv.addObject("contract", contract);
        mv.setViewName("/review/insert");
        return mv;
    }
    @RequestMapping(value = "/review/insert", method = RequestMethod.POST)
	public ModelAndView reviewInsertPost(ModelAndView mv, ReviewVO review, HttpSession session,
			MultipartFile []files, HttpServletResponse response) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = reviewService.insertReview(review, user, files);
		if(res)
			messageService.message(response, "리뷰를 등록했습니다.", "/spring/review/select?re_num="+review.getRe_num());
		else
			messageService.message(response, "리뷰 등록에 실패했습니다.", "/spring/review/select?re_num="+review.getRe_num());
		return mv;
	}
}
