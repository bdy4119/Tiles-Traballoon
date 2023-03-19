package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.ReviewDao;
import mul.cam.a.dto.ReviewComment;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;
import mul.cam.a.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDao dao;

	
	//리스트 뿌리기
	@Override
	public List<ReviewDto> review(ReviewParam Param) {
		return dao.review(Param);
	}

	
	//페이지 넘버
	@Override
	public int getAllReview(ReviewParam Param) {
		return dao.getAllReview(Param);
	}
	

	//readcountOrder
	@Override
	public List<ReviewDto> readcountOrder(ReviewDto dto) {
		return dao.readcountOrder(dto);
	}
	
	
	//wdateOrder
	@Override
	public List<ReviewDto> wdateOrder(ReviewDto dto) {
		return dao.wdateOrder(dto);
	}
	
	
	//longdateOrder
	@Override
	public List<ReviewDto> longdateOrder(ReviewDto dto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	

	//detail
	@Override
	public ReviewDto getReview(int seq) {
		return dao.getReview(seq);
	}
	
	
	@Override
	public int readcount(int seq) {
		int readcount = dao.readcount(seq);
		return readcount;
	}

	
	//reviewwrite
	@Override
	public boolean writeReviewAf(ReviewDto dto) {
		int n = dao.writeReviewAf(dto);
		return n>0?true:false;
	}
	
	
	//글수정
	@Override
	public boolean reviewUpdate(ReviewDto dto) {
		int n = dao.reviewUpdate(dto);
		return n>0?true:false;
	}
	
	
	//글삭제
	@Override
	public boolean reviewDelete(int seq) {
		int n = dao.reviewDelete(seq);
		return n>0?true:false;
	}

	//답글
	@Override
	public boolean answerReview(ReviewDto dto) {
		//수정은 할 수도 있고 안할 수도 있으므로 리턴 안함
		dao.answerReviewUpdate(dto);
		int n = dao.answerReviewInsert(dto);
		
		return n>0?true:false;
	}

	//댓글추가
	@Override
	public boolean commentWrite(ReviewComment comment) {
		int n = dao.commentWrite(comment);
		return n>0?true:false;
	}

	//댓글 뿌리기
	@Override
	public List<ReviewComment> commentList(int seq) {
		return dao.commentList(seq);
	}
	
	
	
}
