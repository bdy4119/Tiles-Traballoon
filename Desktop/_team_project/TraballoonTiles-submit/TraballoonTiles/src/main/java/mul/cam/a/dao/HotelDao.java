package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.HotelCommentDto;
import mul.cam.a.dto.HotelDto;
import mul.cam.a.dto.HotelPagingDto;

public interface HotelDao {
/* 1페이지(호텔페이지)   */
	
	//호텔list 모두 가져오기 + orderby정렬 + 페이징
	//hotellist를 HotelDto 객체의 리스트(List<HotelDto>)로 반환
	List<HotelDto> hotellist(HotelPagingDto param);

	//조회수 증가 (정렬에 활용)
	void updateReadCount(int seq);
	
	//데이터 총수 가져오기 ( 페이징에 활용 )
	int getHotelTotalCount();

	
/* 2페이지(호텔 상세페이지)   */	
	//seq에 해당하는 데이터(hoteldto)가져오기
	HotelDto getHotel(int seq);
	
	//댓글 등록하기
	int HotelcommentWrite(HotelCommentDto com);	  
	
	//댓글 목록 가져오기 (댓글 화면에 뿌려주기 위해)
	List<HotelCommentDto> HotelcommentList(int hotelseq);
		
}