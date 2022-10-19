package kr.sunrise.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.pagination.PageMaker;
import kr.sunrise.spring.service.FileService;
import kr.sunrise.spring.service.MessageService;
import kr.sunrise.spring.service.NoticeService;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	@Autowired
    FileService fileService;
	@Autowired
	MessageService messageService;
	
	//공지사항 등록
	@RequestMapping(value = "/notice/insert", method = RequestMethod.GET)
    public ModelAndView noticeInsertGet(ModelAndView mv) {
        mv.setViewName("/notice/insert");
        return mv;
    }
	//공지사항 작성
	@RequestMapping(value = "/notice/insert", method = RequestMethod.POST)
	public ModelAndView noticeInsertPost(ModelAndView mv, NoticeVO notice, HttpSession session,
			MultipartFile []files, HttpServletResponse response) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = noticeService.insertNotice(notice, user, files);
		if(res)
			messageService.message(response, "공지사항을 등록했습니다.", "/spring/notice/select?no_num="+notice.getNo_num());
		else
			messageService.message(response, "공지사항 등록에 실패했습니다.", "/spring/notice/select?no_num="+notice.getNo_num());
		return mv;
	}
	//공지사항리스트
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public ModelAndView noticeListGet(ModelAndView mv, String no_where, Criteria cri) {
		ArrayList<NoticeVO> list = noticeService.getNoticeList(cri, no_where);
		int totalCount = noticeService.getNoticeTotalCount(cri, no_where);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.addObject("no_where", no_where);
		mv.setViewName("/notice/list");
		return mv;
	}
	//공지사항 상세 메소드
    @RequestMapping(value = "/notice/select", method = RequestMethod.GET)
	public ModelAndView noticeSelectGet(ModelAndView mv, Integer no_num) {
		NoticeVO notice = noticeService.getNotice(no_num);
		ArrayList<FileVO> fileList = fileService.selectFileList("notice", no_num);
		mv.addObject("fileList", fileList);
		mv.addObject("notice", notice);
		mv.setViewName("/notice/select");
		return mv;
	}
    //수정하는 메소드
    @RequestMapping(value = "/notice/update/{no_num}", method = RequestMethod.GET)
	public ModelAndView noticeUpdateGet(ModelAndView mv, @PathVariable("no_num")Integer no_num,
			HttpSession session, HttpServletResponse response, String fi_ta_name, Integer fi_same_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		NoticeVO notice = noticeService.getNotice(no_num);
		ArrayList<FileVO> fileList = fileService.selectFileList("notice", no_num);
		mv.addObject("fileList", fileList);
		mv.addObject("notice", notice);
		if(noticeService.isWriter(notice,user)) {
		mv.setViewName("/notice/update");
		}else {
			messageService.message(response, "", "/spring/notice/select?no_num="+no_num);
		}
		return mv;
	}
    @RequestMapping(value = "/notice/update/{no_num}", method = RequestMethod.POST)
	public ModelAndView noticeUpdatePost(ModelAndView mv, @PathVariable("no_num")Integer no_num, NoticeVO notice, HttpSession session,
			MultipartFile []files, HttpServletResponse response, int[]nums) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = noticeService.updateNotice(notice, user, files, nums);
		if(res)
			messageService.message(response, "공지사항을 수정했습니다.", "/spring/notice/select?no_num="+notice.getNo_num());
		else
			messageService.message(response, "공지사항 수정에 실패했습니다.", "/spring/notice/select?qu_num="+notice.getNo_num());
		return mv;
	}
    //공지사항 삭제 메소드
    @RequestMapping(value = "/notice/delete", method = RequestMethod.GET)
	public ModelAndView noticeDeletePost(ModelAndView mv, int no_num,
			HttpSession session, HttpServletResponse response, String no_where,
			NoticeVO notice) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = noticeService.deleteNotice(no_num, user, "notice", no_num);
		if(res)
			messageService.message(response, "공지사항이 삭제되었습니다.", "/spring/notice/list");
		else
			messageService.message(response, "게시글 삭제에 실패했습니다.", "/spring/notice/select?no_num="+notice.getNo_num());
		return mv;
	}
}
