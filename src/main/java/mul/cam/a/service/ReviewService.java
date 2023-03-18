package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.ReviewComment;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

public interface ReviewService {

	//리스트 뿌리기
	List<ReviewDto> review(ReviewParam Param);
	
	//페이지 넘버
	int getAllReview(ReviewParam Param);
	
	//readcountOrder
	List<ReviewDto> readcountOrder(ReviewDto dto);
	
	//wdateOrder
	List<ReviewDto> wdateOrder(ReviewDto dto);
	
	
	//longdateOrder
	List<ReviewDto> longdateOrder(ReviewDto dto);
	

	//detail
	ReviewDto getReview(int seq);
	
	//readcount
	int readcount(int seq);
	
	//글쓰기
	boolean writeReviewAf(ReviewDto dto);
	
	//글수정
	boolean reviewUpdate(ReviewDto dto);
	
	//글삭제
	boolean reviewDelete(int seq);
	
	//답글 수정/추가
	boolean answerReview(ReviewDto dto);
	
	//댓글 추가/뿌리기
	boolean commentWrite(ReviewComment comment);
	List<ReviewComment> commentList(int seq);
	
}
