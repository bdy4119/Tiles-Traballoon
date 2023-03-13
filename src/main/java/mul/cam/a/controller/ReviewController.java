package mul.cam.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.cam.a.dto.ReviewComment;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;
import mul.cam.a.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	
	@GetMapping(value="review.do")
	public String review(ReviewParam param, Model model) {
		
		// 글의 시작과 끝
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		
		List<ReviewDto> list = service.review(param);
		int len = service.getAllReview(param);
		
		int pageBbs = len / 10;		// 25 / 10 -> 2
		if((len % 10) > 0) {
			pageBbs = pageBbs + 1;
		}
		
		if(param.getChoice() == null || param.getChoice().equals("")
			|| param.getSearch() == null || param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}
		
		//					review라는 이름으로 list를 뷰에서 사용해라
		model.addAttribute("review", list);	// 게시판 리스트
		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어	
		
		return "review";
	}

	
	//reviewdetail
	@GetMapping("reviewdetail.do")
    public String reviewdetail(Model model, int seq) {
		ReviewDto dto =service.getReview(seq);
		int readcount = service.readcount(seq);
		model.addAttribute("dto", dto);
		model.addAttribute("readcount");
		
        return "reviewdetail";
    }
	
	
	
	//reviewwrite
	@GetMapping("reviewwrite.do")
	public String reviewwrite() {
		return "reviewwrite";
	}
	
	
	
	//reviewUpdate
	@PostMapping(value="reviewUpdate.do")
	public String reviewUpdate(Model model, int seq) {
		ReviewDto dto = service.getReview(seq);
		model.addAttribute("dto", dto);
		
		return "reviewUpdate";
	}
	
	
	//reviewwriteAf
	//로그인 되고 난 다음에는 post로 바꾸기
	@PostMapping(value="reviewwriteAf.do")
	public String writeReview(Model model, ReviewDto dto) {
		boolean isS = service.writeReview(null);
		String reviewwrite = "REVIEW_ADD_OK";
		if(isS == false) {
			reviewwrite = "REVIEW_ADD_NO";
		}
		model.addAttribute("reviewwrite", reviewwrite);
		return "redirect:/review.do";
	}
	
	
	
	
	//답글(사용할지 말지 고민중)
	@PostMapping(value = "answer.do")
	public String answer(Model model, int seq, ReviewDto dto) {
		dto.setSeq(seq);
		
		boolean isS = service.answerReview(dto);
		String answer = "REVIEW_ANSWER_OK";
		if(isS == false) {
			answer = "REVIEW_ANSWER_NO";
		}
		model.addAttribute("answer", answer);
		
		return "reviewdetail";
		
	}
	
	
	
	//댓글추가
	//손보기,,,,
	@GetMapping(value = "reviewCommentWrite.do")
	public String commentWrite(ReviewComment comment) {
		boolean isS = service.commentWrite(comment);
		if(isS) {
			System.out.println("댓글 작성 성공");
		} else {
			System.out.println("댓글 작성 실패");
		}
		
		return "redirect:/reviewdetail.do?seq=" + comment.getSeq();
	}
	
	
	
	//댓글 뿌리기
	@ResponseBody	//ajax사용함
	@GetMapping(value="reviewCommentList.do")
	public List<ReviewComment> commentList(int seq) {
		List<ReviewComment> list = service.commentList(seq);
		return list;
	}
	
	
	
	
	
	
}
