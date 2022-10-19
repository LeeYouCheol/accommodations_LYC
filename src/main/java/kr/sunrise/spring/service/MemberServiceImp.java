package kr.sunrise.spring.service;

import java.util.ArrayList;
import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.sunrise.spring.dao.MemberDAO;
import kr.sunrise.spring.vo.BusinessMemberVO;
import kr.sunrise.spring.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDAO memberDao;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender;

	@Override
	public boolean signup(MemberVO member) {
		if(member == null)
			return false;
		if(member.getMe_id() == null || member.getMe_id().length() == 0)
			return false;
		if(member.getMe_pw() == null || member.getMe_pw().length() == 0)
			return false;
		if(member.getMe_email() == null || member.getMe_email().length() == 0)
			return false;
		if((member.getMe_gender() != 'M' && member.getMe_gender() != 'f'))
			return false;
		MemberVO dbMember = memberDao.selectMember(member.getMe_id());
		//이미 가입된 아이디이면
		if(dbMember != null)
			return false;
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String me_code = createRandom(str, 6);
		member.setMe_code(me_code);
		//비밀번호 암호화
		String newPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(newPw);
		try {
			memberDao.insertMember(member);
			if(member instanceof BusinessMemberVO) {
				((BusinessMemberVO) member).setBm_me_id(member.getMe_id());
				memberDao.insertBusinessMember(member);
			}
			//메일로 링크를 보내줌
			String title = "고시원모아 인증메일 입니다.";
			String content = 
					"아래링크를 클릭하면 인증이 완료됩니다.<br>" +
					"<a href='http://localhost:8080/spring/signup/success?me_code="+me_code+"&me_email="+member.getMe_email()+"'>" +
							"http://localhost:8080/spring/signup/success?me_code="+me_code+"me_email="+member.getMe_email()+
					"</a>";
			sendEmail(title, content, member.getMe_email());
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	//me_code 랜덤생성 메소드
	private String createRandom(String str, int count) {
		if(str == null)
			return "";
		String randomStr = "";
			
		for(int i = 0; i<count; i++) {
			int r = (int)(Math.random() * str.length());
			randomStr += str.charAt(r);
		}
		return randomStr;
	}
	@Override
	public boolean sendEmail(String title, String content, String receiver) {
		 try {
		        MimeMessage message = mailSender.createMimeMessage();
		        MimeMessageHelper messageHelper 
		            = new MimeMessageHelper(message, true, "UTF-8");

		        messageHelper.setFrom("hosw36@naver.com");  // 보내는사람 생략하거나 하면 정상작동을 안함
		        messageHelper.setTo(receiver);     // 받는사람 이메일
		        messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		        messageHelper.setText(content, true);  // 메일 내용

		        mailSender.send(message);
		    } catch(Exception e){
		        System.out.println(e);
		    }
		return false;
	}
	@Override
	public boolean emailActive(MemberVO member) {
		if(member == null || member.getMe_email() == null || member.getMe_code() == null)
			return false;
		MemberVO user = memberDao.selectMember(member.getMe_email());
		
		if(user == null)
			return false;
		
		if(user.getMe_pos_count() > 5)
			return false;
		
		if(user.getMe_pos() == 1)
			return true;
		
		if(user.getMe_code().equals(member.getMe_code())) {
			memberDao.updatePos(user.getMe_id(), "1");
			return true;
		}
		memberDao.updatePosCount(user.getMe_id());
		return false;
	}
	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_id() == null || member.getMe_pw() == null)
			return null;
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if(user == null)
			return null;
		if(user.getMe_pos() != 1)
			return null;
		
		user.setAutoLogin(member.isAutoLogin());
		
		if(passwordEncoder.matches(member.getMe_pw(), user.getMe_pw()))
			return user;
		return null;
	}
	@Override
	public boolean isUser(MemberVO member) {
		if(member == null || member.getMe_id() == null)
			return false;
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if(user != null)
			return false;
		return true;
	}
	//자동로그인 관련
	@Override
	public void keepLogin(String me_id, String me_s_id, Date me_s_limit) {
		if(me_id == null || me_s_id == null || me_s_limit == null)
			return;
		memberDao.updateMemberSession(me_id, me_s_id, me_s_limit);
	}
	@Override
	public MemberVO autoLogin(String me_s_id) {
		if(me_s_id == null)
			return null;
		return memberDao.selectMemberBySession(me_s_id);
	}
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		if(request == null)
			return;
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		//로그인을 안햇는데 로그아웃 시도를 하면 리턴.
		if(user == null)
			return;
		session.removeAttribute("user");
		
		if(response == null)
			return;
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie == null)
			return;
		loginCookie.setPath("/");
		loginCookie.setMaxAge(0);
		response.addCookie(loginCookie);
		keepLogin(user.getMe_id(), null, null);
	}
	@Override
	public boolean checkId(MemberVO member) {
		if(member == null || member.getMe_id() == null)
			return false;
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if(user != null)
			return false;
		return true;
	}
	//아이디찾기-아이디목록불러오기
	@Override
	public ArrayList<String> getIdList(MemberVO member) {
		if(member == null)
			return null;
		return memberDao.selectIdList(member);
	}
	@Override
	public boolean findpw(MemberVO member) {
		if(member == null || member.getMe_id() == null || member.getMe_email() == null) {
			return false;
		}
		
		MemberVO Member = memberDao.selectMemberByIdEmail(member);
		
		if(Member == null) {
			return false;
		}
		//임시 비번 발급 - 랜덤으로 8자리, 영문(대소문자 다 가능 => 26,26), 숫자(10)만 가능
		String newPw = "";
		int max = 8;
		for(int i = 0; i<max; i++) {
			int r = (int)(Math.random()*62);
			//r : 0~9 => 숫자, 10~35 => 소문자, 36~61 => 대문자
			if(r < 9)
				newPw += r;
			else if(r <= 35)
				newPw += (char)('a' + r - 10);
			else
				newPw += (char)('a' + r - 36);
		}
		
		//임시 비번을 등록된 이메일로 전송
		sendEmail("임시 비밀번호 입니다.", "임시 비밀번호를 발급했습니다. 임시 비밀번호는 <b>"+newPw+"</b>입니다.", member.getMe_email());
		//새 비번을 회원 정보에 저장(암호화 해서)
		String encPw = passwordEncoder.encode(newPw);
		Member.setMe_pw(encPw);
		memberDao.updateMember(Member);
		return true;
	}
	@Override
	public ArrayList<BusinessMemberVO> getBmList(BusinessMemberVO bm) {
		if(bm == null)
			return null;
		return memberDao.selectBmList(bm);
	}
	@Override
	public void updateMember(MemberVO member, MemberVO user) {
		if(member == null || user == null || member.getMe_id() == null)
			return;
		//화면에서 보낸 아이디와 로그인한 아이디가 다르면 수정 안함
		if(!member.getMe_id().equals(user.getMe_id()))
			return;
		user.setMe_gender(member.getMe_gender());
		user.setMe_email(member.getMe_email());
		user.setMe_post_code(member.getMe_post_code());
		user.setMe_addr(member.getMe_addr());
		user.setMe_addr_detail(member.getMe_addr_detail());
		user.setMe_phone(member.getMe_phone());
		user.setMe_job(member.getMe_job());
		
		if(member.getMe_authority() != null)
			user.setMe_authority(member.getMe_authority());
		//비밀번호가 있으면 암호화하여 저장
		if(member.getMe_pw() != null || member.getMe_pw().length() != 0) {
			String encPw = passwordEncoder.encode(member.getMe_pw());
			user.setMe_pw(encPw);
		}
		memberDao.updateMember(user);
		
	}
	@Override
	public boolean updatePosPermit(BusinessMemberVO bm) {
		if(bm == null)
			return false;
		MemberVO member = memberDao.selectMember(bm.getBm_me_id());
		member.setMe_authority("B"); 
		memberDao.updatePosPermit(bm);
		//해당 회원의 등급을 변경
		memberDao.updateMember(member);
		return true;
	}
	@Override
	public boolean updatePosCancel(BusinessMemberVO bm) {
		if(bm == null)
			return false;
		MemberVO member = memberDao.selectMember(bm.getBm_me_id());
		member.setMe_authority("N");
		memberDao.updatePosCancel(bm);
		//해당 회원의 등급을 변경
		memberDao.updateMember(member);
		return true;
	}
}
