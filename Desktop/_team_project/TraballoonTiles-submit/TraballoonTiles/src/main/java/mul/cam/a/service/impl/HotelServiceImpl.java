package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.HotelDao;
import mul.cam.a.dto.HotelCommentDto;
import mul.cam.a.dto.HotelDto;
import mul.cam.a.dto.HotelPagingDto;
import mul.cam.a.service.HotelService;


@Service
public class HotelServiceImpl implements HotelService {
	
@Autowired
HotelDao dao;

/* 1페이지(호텔페이지)   */

	//호텔list 모두 가져오기 + orderby정렬 + 페이징
	//hotellist를 HotelDto 객체의 리스트(List<HotelDto>)로 반환
	@Override
	public List<HotelDto> hotellist(HotelPagingDto param) {
		return dao.hotellist(param);
	}
	
	//조회수 증가 (정렬에 활용)
	@Override
	public void updateReadCount(int seq) {
	   dao.updateReadCount(seq);
	}
	//데이터 총수 가져오기 ( 페이징에 활용 )
	@Override
	public int getHotelTotalCount() {
		return dao.getHotelTotalCount();
	}

/* 2페이지(호텔 상세페이지)   */
	
	//seq에 해당하는 데이터(hoteldto)가져오기
	@Override
	public HotelDto getHotel(int seq) {
		return dao.getHotel(seq);
	}
	
	//댓글 등록하기
	@Override
	public boolean HotelcommentWrite(HotelCommentDto com) {
		int n = dao.HotelcommentWrite(com);
		return n<0?true:false;
	}

	//seq에 맞는 등록 댓글 목록 가져오기 (댓글 화면에 뿌려주기 위해)
	@Override
	public List<HotelCommentDto> HotelcommentList(int hotelseq) {
		return dao.HotelcommentList(hotelseq);
	}
}
