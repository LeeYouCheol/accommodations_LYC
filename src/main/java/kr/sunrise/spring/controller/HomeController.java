package kr.sunrise.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.service.AccommodationsService;
import kr.sunrise.spring.service.MemberService;
import kr.sunrise.spring.vo.AccommodationsVO;
import kr.sunrise.spring.vo.BusinessMemberVO;
import kr.sunrise.spring.vo.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
    MemberService memberService;
	@Autowired
	AccommodationsService accommodationsService;
	
	//홈페이지메소드
    @RequestMapping(value="/")
    public ModelAndView main(ModelAndView mv) {
        mv.setViewName("/main/home");
        return mv;
    }
    //회원가입 메소드
    //회원분류
    @RequestMapping(value = "/signup/sort", method = RequestMethod.GET)
	public ModelAndView signupSortGet(ModelAndView mv) {
		mv.setViewName("/main/signupSort");
		return mv;
	}
    @RequestMapping(value = "/signup/sort", method = RequestMethod.POST)
	public ModelAndView signupSortPost(ModelAndView mv) {
		mv.setViewName("/main/signupSort");
		return mv;
	}
    //일반회원
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {
		mv.addObject("title", "회원가입");
		mv.setViewName("/main/signup");
		return mv;
	}
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO member) {
		boolean res = memberService.signup(member);
		System.out.println(member);
		if(res)
			mv.setViewName("redirect:/signup/check");
		else
			mv.setViewName("/main/signup");
		return mv;
	}
    //사업자회원
    @RequestMapping(value = "/signup/business", method = RequestMethod.GET)
	public ModelAndView signupBusinessGet(ModelAndView mv) {
		mv.addObject("title", "회원가입");
		mv.setViewName("/main/signupBusiness");
		return mv;
	}
    @RequestMapping(value = "/signup/business", method = RequestMethod.POST)
	public ModelAndView signupBusinessPost(ModelAndView mv, BusinessMemberVO member) {
		boolean res = memberService.signup(member);
		System.out.println(member);
		if(res)
			mv.setViewName("redirect:/signup/check");
		else
			mv.setViewName("/main/signupBusiness");
		return mv;
	}
    //아이디 중복체크
  	@RequestMapping(value ="/id/check")
  	@ResponseBody
  	public boolean idCheck(@RequestBody MemberVO member){
  	    return memberService.checkId(member);
  	}
    //회원가입-이메일인증
    @RequestMapping(value = "/signup/check", method = RequestMethod.GET)
	public ModelAndView signupCheckGet(ModelAndView mv) {
		mv.addObject("title", "회원가입완료");
		mv.setViewName("/main/signupCheck");
		return mv;
	}
    @RequestMapping(value = "/signup/success", method = RequestMethod.GET)
	public ModelAndView signupSuccessGet(ModelAndView mv, MemberVO member) {
		boolean res = memberService.emailActive(member);
		mv.addObject("res", res);
		mv.addObject("title", "이메일인증");
		mv.setViewName("/main/signupSuccess");
		return mv;
	}
    
    //로그인
    @RequestMapping(value= "/login", method=RequestMethod.GET)
	public ModelAndView loginGet(ModelAndView mv, HttpServletRequest request) {
		String url = request.getHeader("Referer");
		//로그인 화면을 url을 직접 입력하지 않고, url에 /login이 없으면 => 돌아가야할 url이 있으면
		if(url != null && !url.contains("/login"))
			request.getSession().setAttribute("redirectURL", url);
		mv.setViewName("/main/login");
		return mv;
	}
    @RequestMapping(value= "/login", method=RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, MemberVO member) {
		MemberVO user = memberService.login(member);
		System.out.println(user);
		mv.addObject("user", user);
		mv.setViewName("redirect:/");
		return mv;
	}
  //로그아웃기능
  	@RequestMapping(value= "/logout", method=RequestMethod.GET)
  	public ModelAndView logoutGet(ModelAndView mv, HttpServletResponse response,
  			HttpServletRequest request) {
  		memberService.logout(request, response);
  		mv.setViewName("redirect:/");
  		return mv;
  	}
  //아이디찾기
  	@RequestMapping(value= "/find", method=RequestMethod.GET)
  	public ModelAndView logoutGet(ModelAndView mv, String type) {
  		
  		mv.addObject("type", type);
  		mv.setViewName("/main/find");
  		return mv;
  	}
  	//마이페이지
  	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public ModelAndView memberMypageGet(ModelAndView mv, Criteria cri) {
  		ArrayList<AccommodationsVO> list = accommodationsService.getAccommodationsList(cri);
  		mv.addObject("list", list);
		mv.setViewName("/member/mypage");
		return mv;
	}
  	//ajax
  	@RequestMapping(value = "/id/check", method = RequestMethod.POST)
  	@ResponseBody
  	public Map<Object, Object> checkEmail(@RequestBody MemberVO member) {
  		HashMap<Object, Object> map = new HashMap<Object, Object>();
  		boolean res = memberService.isUser(member);
  		map.put("res", res);
  		return map;
  	}
  //아이디 찾기
  	@RequestMapping(value ="/find/id")
  	@ResponseBody
  	public Map<Object, Object> findId(@RequestBody MemberVO member){
  		HashMap<Object, Object> map = new HashMap<Object, Object>();
  		ArrayList<String> idList = memberService.getIdList(member);
  		map.put("idList", idList);
  	    return map;
  	}
  	@ResponseBody
	public Map<Object, Object> findPw(@RequestBody MemberVO member){
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		//memberService.sendEmail("제목", "내용", "hosw33@naver.com");
		boolean res = false;
		boolean exception = false;
		try {
			res = memberService.findpw(member);
		}catch(Exception e) {
			exception = true;
		}
		map.put("res", res);
		map.put("exception", exception);
	    return map;
	}
  	
}
