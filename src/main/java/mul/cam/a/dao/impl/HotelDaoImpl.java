package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.HotelDao;
import mul.cam.a.dto.HotelCommentDto;
import mul.cam.a.dto.HotelDto;
import mul.cam.a.dto.HotelPagingDto;

@Repository // == 저장소
public class HotelDaoImpl implements HotelDao {

	@Autowired  // 자동생성
	SqlSession session;

	String ns = "Hotel.";
/* 1페이지(호텔페이지)   */
	
	//호텔list 모두 가져오기 + orderby정렬 + 페이징
	//hotellist를 HotelDto 객체의 리스트(List<HotelDto>)로 반환
	@Override
	public List<HotelDto> hotellist(HotelPagingDto param) {
		return session.selectList(ns + "hotellist", param);
	}
	
	//조회수 증가 (정렬에 활용)
	@Override
	public void updateReadCount(int seq) {
		 session.update(ns + "updateReadCount", seq);
	}
	
	//데이터 총수 가져오기 ( 페이징에 활용 )
	@Override
	public int getHotelTotalCount() {
		return session.selectOne(ns + "getHotelTotalCount");
	}

	
/* 2페이지(호텔 상세페이지)   */	
	//seq에 해당하는 데이터(hoteldto)가져오기
	@Override
	public HotelDto getHotel(int seq) {
		return session.selectOne(ns + "getHotel", seq);	
	}
	
	//댓글 등록하기
	@Override
	public int HotelcommentWrite(HotelCommentDto com) {	
		return session.insert(ns + "HotelcommentWrite", com);
	}
		
	//seq에 맞는 등록 댓글 목록 가져오기 (댓글 화면에 뿌려주기 위해)
	@Override
	public List<HotelCommentDto> HotelcommentList(int hotelseq) {
		return session.selectList(ns + "HotelcommentList", hotelseq);
	}
}