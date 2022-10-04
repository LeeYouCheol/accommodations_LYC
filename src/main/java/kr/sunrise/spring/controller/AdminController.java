package kr.sunrise.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	//홈페이지메소드
    @RequestMapping(value="/admin/mypage", method = RequestMethod.GET)
    public ModelAndView adminMypage(ModelAndView mv) {
        mv.setViewName("/admin/mypage");
        return mv;
    }
}
