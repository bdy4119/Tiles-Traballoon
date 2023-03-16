package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.BbsDto;
import mul.cam.a.dto.HotelCommentDto;
import mul.cam.a.dto.HotelDto;
import mul.cam.a.dto.HotelPagingDto;

public interface HotelService {
	
/* 1페이지(호텔페이지)   */
	List<HotelDto> hotellist(String orderBy);
	
	List<HotelDto> getHotelsPaging(HotelPagingDto param);

	int getHotelTotalCount();
	
	//조회수 증가
	void updateReadCount(int seq);
	
	
/* 2페이지(호텔 상세페이지)   */
	//seq에 맞는 hoteldto가져오기
	HotelDto getHotel(int seq);
	
	//댓글 등록
	boolean HotelcommentWrite(HotelCommentDto com); //리턴값 boolean으로 변경
	
	//댓글 목록 가져오기	
	List<HotelCommentDto> HotelcommentList(int seq);

	
	
}