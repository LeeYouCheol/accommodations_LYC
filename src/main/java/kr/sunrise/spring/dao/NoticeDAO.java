package kr.sunrise.spring.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.sunrise.spring.pagination.Criteria;
import kr.sunrise.spring.vo.NoticeVO;

public interface NoticeDAO {

	ArrayList<NoticeVO> selectNoticeList(@Param("cri")Criteria cri, @Param("no_where")String no_where);

	int selectNoticeTotalCount(@Param("cri")Criteria cri, @Param("no_where")String no_where);

	int insertNotice(NoticeVO notice);

	NoticeVO selectNotice(Integer no_num);

	int updateNotice(NoticeVO dbNotice);

	int deleteNotice(Integer no_num);

}
