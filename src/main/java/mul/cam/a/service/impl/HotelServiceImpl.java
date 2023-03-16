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
	@Override
	public List<HotelDto> hotellist(String orderBy) {
		return dao.hotellist(orderBy);
	}
	
	@Override
	public List<HotelDto> getHotelsPaging(HotelPagingDto param) {
		return dao.getHotelsPaging(param);
	}

	@Override
	public int getHotelTotalCount() {
		return dao.getHotelTotalCount();
	}
	
	/*----------------------------------------------------------------------------*/
	//조회수 증가
	@Override
    public void updateReadCount(int seq) {
        dao.updateReadCount(seq);
	}
	
/* 2페이지(호텔 상세페이지)   */
	
	//seq에 해당하는 게시글 가져오기
	@Override
	public HotelDto getHotel(int seq) {
		return dao.getHotel(seq);
	}
	
	//댓글 등록
	@Override
	public boolean HotelcommentWrite(HotelCommentDto com) {
		int n = dao.HotelcommentWrite(com);
		return n<0?true:false;
	}

	//댓글 목록 가져오기
	@Override
	public List<HotelCommentDto> HotelcommentList(int hotelseq) {
		return dao.HotelcommentList(hotelseq);
	}

	



	

}
