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
	
	// hotellist를 HotelDto 객체의 리스트(List<HotelDto>)로 반환
	@Override
	public List<HotelDto> hotellist(String orderBy) {
		return session.selectList(ns + "hotellist", orderBy);
	}
	
	//페이징
	@Override
	public List<HotelDto> getHotelsPaging(HotelPagingDto param) {
		return session.selectList("Hotel.getHotelsPaging", param);
	}
	
	@Override
	public int getHotelTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//정렬(조회수순, 댓글순)
	//조회수 증가 : 영향 받은 row의 개수 반환
		@Override
		public void updateReadCount(int seq) {
		    session.update(ns + "updateReadCount", seq);
		}
		
	
/* 2페이지(호텔 상세페이지)   */	

	@Override
	public HotelDto getHotel(int seq) {
		return session.selectOne(ns + "getHotel", seq);
		
	}
	
		
	//댓글 등록
	@Override
	public int HotelcommentWrite(HotelCommentDto com) {	
		return session.insert(ns + "HotelcommentWrite", com);
	}
		
	//댓글 목록 가져오기
	@Override
	public List<HotelCommentDto> HotelcommentList(int hotelseq) {
		return session.selectList(ns + "HotelcommentList", hotelseq);
	}



	

	

	


}
