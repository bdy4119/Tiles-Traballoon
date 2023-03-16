package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.HotelCommentDto;
import mul.cam.a.dto.HotelDto;
import mul.cam.a.dto.HotelPagingDto;

public interface HotelDao {
/* 1페이지(호텔페이지)   */
	List<HotelDto> hotellist(String orderBy);
	
	List<HotelDto> getHotelsPaging(HotelPagingDto param);

	int getHotelTotalCount();
	
	//조회수 증가
	void updateReadCount(int seq);
	
/* 2페이지(호텔 상세페이지)   */	
	HotelDto getHotel(int seq);
	
	//댓글 등록
	int HotelcommentWrite(HotelCommentDto com);	  
	//댓글 목록 가져오기
	List<HotelCommentDto> HotelcommentList(int hotelseq);
		
}