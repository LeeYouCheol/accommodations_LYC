package kr.sunrise.spring.interceptor;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.sunrise.spring.service.MemberService;
import kr.sunrise.spring.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	MemberService memberService;
	
	@Override
	public void postHandle(
	    HttpServletRequest request, 
	    HttpServletResponse response, 
	    Object handler, 
	    ModelAndView modelAndView)
	    throws Exception {
	    ModelMap modelMap = modelAndView.getModelMap();
	    MemberVO user = (MemberVO)modelMap.get("user");

	    if(user != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("user", user);
	        if(user.isAutoLogin()) {
	        	Cookie loginCookie = new Cookie("loginCookie", session.getId());
	        	int timeSecond = 60 * 60 * 24* 7; //7일을 초로 환산 60초 60분 24시간 31일
	        	loginCookie.setPath("/");//쿠키경로 설정저장할곳
	        	loginCookie.setMaxAge(timeSecond);//쿠키유지시간
	        	response.addCookie(loginCookie);
	        	//DB에 저장(세션아이디, 만료시간)
	        	memberService.keepLogin(user.getMe_id(), session.getId(),
	        			new Date(System.currentTimeMillis() + timeSecond * 1000));
	        }
	    }
	}
}
