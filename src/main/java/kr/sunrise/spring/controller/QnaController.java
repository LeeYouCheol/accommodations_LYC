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
import kr.sunrise.spring.service.QnaService;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.QuestionVO;

@Controller
public class QnaController {
	
	@Autowired
    QnaService qnaService;
	@Autowired
    FileService fileService;
	@Autowired
	MessageService messageService;
	
    //고객센터-QnA리스트
    @RequestMapping(value = "/qna/question/list", method = RequestMethod.GET)
	public ModelAndView qnaListGet(ModelAndView mv, String qu_where, Criteria cri) {
		ArrayList<QuestionVO> list = qnaService.getQuestionList(cri, qu_where);
		int totalCount = qnaService.getQuestionTotalCount(cri, qu_where);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.addObject("qu_where", qu_where);
		mv.setViewName("/qna/questionList");
		return mv;
	}
    //고객센터-QnA작성
    @RequestMapping(value = "/qna/question/insert", method = RequestMethod.GET)
    public ModelAndView questionInsertGet(ModelAndView mv) {
        mv.setViewName("/qna/questionInsert");
        return mv;
    }
    @RequestMapping(value = "/qna/question/insert", method = RequestMethod.POST)
	public ModelAndView questionInsertPost(ModelAndView mv, QuestionVO question, HttpSession session,
			MultipartFile []files, HttpServletResponse response) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = qnaService.insertQuestion(question, user, files);
		if(res)
			messageService.message(response, "질문을 등록했습니다.", "/spring/qna/questionSelect?qu_num="+question.getQu_num());
		else
			messageService.message(response, "질문 등록에 실패했습니다.", "/qna/questionSelect?qu_num="+question.getQu_num());
		return mv;
	}
    //게시글 상세 메소드
    @RequestMapping(value = "/qna/question/select/{qu_num}", method = RequestMethod.GET)
	public ModelAndView questionSelectGet(ModelAndView mv, 
			@PathVariable("qu_num") Integer qu_num) {
		QuestionVO question = qnaService.getQuestion(qu_num);
		ArrayList<FileVO> fileList = fileService.selectFileList("question", qu_num);
		mv.addObject("fileList", fileList);
		mv.addObject("question", question);
		mv.setViewName("/qna/questionSelect");
		return mv;
	}
    //수정하는 메소드
    @RequestMapping(value = "/qna/question/update/{qu_num}", method = RequestMethod.GET)
	public ModelAndView boardUpdateGet(ModelAndView mv, @PathVariable("qu_num")Integer qu_num,
			HttpSession session, HttpServletResponse response, String fi_ta_name, Integer fi_same_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		QuestionVO question = qnaService.getQuestion(qu_num);
		ArrayList<FileVO> fileList = fileService.selectFileList("question", qu_num);
		mv.addObject("fileList", fileList);
		mv.addObject("question", question);
		if(qnaService.isWriter(question,user)) {
		mv.setViewName("/qna/questionUpdate");
		}else {
			messageService.message(response, "", "/qna/question/select?qu_num="+qu_num);
		}
		return mv;
	}
    @RequestMapping(value = "/qna/question/update/{qu_num}", method = RequestMethod.POST)
	public ModelAndView boardUpdatePost(ModelAndView mv, @PathVariable("qu_num")Integer qu_num, QuestionVO question, HttpSession session,
			MultipartFile []files, HttpServletResponse response, int[]nums) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = qnaService.updateQuestion(question, user, files, nums);
		if(res)
			messageService.message(response, "게시글을 수정했습니다.", "/qna/question/select?qu_num="+question.getQu_num());
		else
			messageService.message(response, "게시글 수정에 실패했습니다.", "/qna/question/select?qu_num="+question.getQu_num());
		return mv;
	}
    //QnA 삭제 메소드
    @RequestMapping(value= "/qna/question/delete/{qu_num}", method=RequestMethod.GET)
	public ModelAndView questionDeleteGet(ModelAndView mv,
			@PathVariable("qu_num")Integer qu_num, HttpSession session,
			String fi_ta_name, int fi_same_num) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		qnaService.deleteQuestion(qu_num, user, fi_ta_name, fi_same_num);
		mv.setViewName("redirect:/qna/questionList");
		return mv;
	}
    @RequestMapping(value = "/qna/question/delete/{qu_num}", method = RequestMethod.POST)
	public ModelAndView questionDeletePost(ModelAndView mv, @PathVariable("qu_num")Integer qu_num,
			HttpSession session, HttpServletResponse response, String qu_where,
			QuestionVO question, String fi_ta_name, int fi_same_num) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = qnaService.deleteQuestion(qu_num, user, fi_ta_name, fi_same_num);
		if(res)
			messageService.message(response, "게시글이 삭제되었습니다.", "/qna/questionList");
		else
			messageService.message(response, "게시글 삭제에 실패했습니다.", "/qna/question/select?qu_num="+question.getQu_num());
		return mv;
	}
}
