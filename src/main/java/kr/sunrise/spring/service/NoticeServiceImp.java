package kr.sunrise.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.sunrise.spring.dao.FileDAO;
import kr.sunrise.spring.dao.NoticeDAO;
import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.FileVO;
import kr.sunrise.spring.vo.MemberVO;
import kr.sunrise.spring.vo.NoticeVO;

@Service
public class NoticeServiceImp implements NoticeService{

	@Autowired
	NoticeDAO noticeDao;
	@Autowired
	FileDAO fileDao;
	@Autowired
	FileService fileService;
	String uploadPath = "C:\\Users\\LYC\\Documents\\GIT\\uploadfiles";
	
	@Override
	public ArrayList<NoticeVO> getNoticeList(Criteria cri, String no_where) {
		if(no_where == null)
			no_where = "";
		if(cri == null)
			cri = new Criteria();
		
		return noticeDao.selectNoticeList(cri,no_where);
	}

	@Override
	public int getNoticeTotalCount(Criteria cri, String no_where) {
		if(no_where == null)
			no_where = "";
		if(cri == null)
			cri = new Criteria();
		return noticeDao.selectNoticeTotalCount(cri,no_where);
	}
	@Override
	public boolean insertNotice(NoticeVO notice, MemberVO user, String no_where) {
		if(notice == null ||
				notice.getNo_title() == null ||
				notice.getNo_title().length() == 0 ||
				notice.getNo_content() == null)
			return false;
		if(user == null)
			return false;
		notice.setNo_me_id(user.getMe_id());
		notice.setNo_where(no_where);
		return noticeDao.insertNotice(notice) == 1 ? true : false;
	}
	
	@Override
	public boolean insertNotice(NoticeVO notice, MemberVO user, MultipartFile[] files) {
		if(notice == null || notice.getNo_where() == null)
			return false;
		
		boolean res = insertNotice(notice, user, notice.getNo_where());
		
		if(!res)
			return false;
		
		fileService.insertFiles(files, "notice", notice.getNo_num());
		return true;
	}

	@Override
	public NoticeVO getNotice(Integer no_num) {
		if(no_num == null)
			return null;
		return noticeDao.selectNotice(no_num);
	}

	@Override
	public boolean isWriter(NoticeVO notice, MemberVO user) {
		if(notice == null || user == null)
			return false;
		return notice.getNo_me_id().equals(user.getMe_id());
	}

	@Override
	public boolean updateNotice(NoticeVO notice, MemberVO user) {
		if(notice == null ||
				notice.getNo_title() == null ||
				notice.getNo_title().length() == 0 ||
				notice.getNo_content() == null)
			return false;
		NoticeVO dbNotice = noticeDao.selectNotice(notice.getNo_num());
		if(dbNotice == null)
			return false;

		if(user.getMe_authority() != "M" && !dbNotice.getNo_me_id().equals(user.getMe_id()))
			return false;
		
		dbNotice.setNo_title(notice.getNo_title());
		dbNotice.setNo_content(notice.getNo_content());
		return noticeDao.updateNotice(dbNotice) == 1 ? true : false;
	}
	
	@Override
	public boolean updateNotice(NoticeVO notice, MemberVO user, MultipartFile[] files, int[] nums) {
		if(user == null || notice == null)
			return false;
		//기존 공지사항정보를 가져옴(기본키를 이용)
		NoticeVO dbNotice = noticeDao.selectNotice(notice.getNo_num());
		//기존 공지사항이 존재하는지 확인하여 없으면 false 리턴
		if(dbNotice == null)
			return false;
		//기존 공지사항 작성자와 user의 아이디와 같은지 확인, 다르면 false를 리턴
		if(!dbNotice.getNo_me_id().equals(user.getMe_id()))
			return false;
		int res = noticeDao.updateNotice(notice);
		if(res != 1)
			return false;
		if(nums != null && nums.length != 0) {
			for(int fi_num : nums) {
				FileVO fileVo = fileDao.selectFile(fi_num);
				if(fileVo == null || fileVo.getFi_same_num() != notice.getNo_num())
					continue;
				fileService.deleteFile(fileVo);
			}
		}
		fileService.insertFiles(files,"notice", notice.getNo_num());
		return true;	
	}

	@Override
	public boolean deleteNotice(Integer no_num, MemberVO user, String fi_ta_name, int fi_same_num) {
		if(no_num == null || user == null)
			return false;
		NoticeVO notice = noticeDao.selectNotice(no_num);
		if(notice == null)
			return false;
		if(user.getMe_authority() != "M" && !notice.getNo_me_id().equals(user.getMe_id()))
			return false;
		
		ArrayList<FileVO> fileList = fileService.selectFileList(fi_ta_name, fi_same_num);
		if(fileList != null && fileList.size() != 0) {
			for(FileVO fileVo : fileList) {
				fileService.deleteFile(fileVo);	
			}
		}
		int res = noticeDao.deleteNotice(no_num);
		return res == 1 ? true : false;
	}

}
