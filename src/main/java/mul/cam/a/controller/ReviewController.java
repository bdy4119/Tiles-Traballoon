package mul.cam.a.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import mul.cam.a.dto.MemberDto;
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
		
//		ReviewDto dto =service.getReview(seq);
		// 글의 시작과 끝
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		List<ReviewDto> list = service.review(param);
	//	List<ReviewDto> orderList = service.orderChoice(param);
		int len = service.getAllReview(param);
		
		int pageBbs = len / 10;		// 25 / 10 -> 2
		if((len % 10) > 0) {
			pageBbs = pageBbs + 1;
		}
		
		if(param.getChoice() == null || param.getChoice().equals("")
			|| param.getSearch() == null || param.getSearch().equals("")
	//		|| param.getChoiceOrder() == null || param.getChoiceOrder().equals("")
			) {
			param.setChoice("검색");
			param.setSearch("");
	//		param.setChoiceOrder("");
		}
		
		                   //review라는 이름으로 list를 뷰에서 사용해라
//		model.addAttribute("dto", dto);
		model.addAttribute("review", list);	// 게시판 리스트
		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
//		model.addAttribute("choiceOrder", param.getChoiceOrder());	// order 카테고리
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
	public String reviewwrite(/* Model model, ReviewDto dto */) {
		/*
		 * String login = dto.getId(); model.addAttribute("dto", dto);
		 */
		
		return "reviewwrite";
	}
	
	
	
	//reviewwriteAf
	@PostMapping(value="writeReviewAf.do")
	public String writeReviewAf(Model model, ReviewDto dto) {
		boolean isS = service.writeReviewAf(dto);
		String writeReviewAf = "REVIEW_ADD_OK";
		if(isS == false) {
			writeReviewAf = "REVIEW_ADD_NO";
		}
		model.addAttribute("writeReviewAf", writeReviewAf);
		return "redirect:/review.do";
	}

	
	
	

	@ResponseBody
	@RequestMapping(value="uploadSummernoteImageFile.do", produces = "application/json; charset=utf8", method = RequestMethod.POST)
//	@PostMapping(value="uploadSummernoteImageFile.do")
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
											HttpServletRequest request) {
		JsonObject jsonObj = new JsonObject();
		
		String contextPath = request.getContextPath();
		
		
        //외부경로로 저장
	//	String fileRoot = "C:\\Users\\PC\\Desktop\\_team_project\\_image";
		
		
		//내부 경로 저장
		String contextRoot = request.getServletContext().getRealPath("/reviewImage");
		
		//separator : 슬래시 등으로 변환해주는 것
		String fileRoot = contextRoot + File.separator;

		//오리지널 파일명
		String originalFileName = multipartFile.getOriginalFilename();
		
		//파일 확장자
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		//저장될 파일명
		//UUID : 파일이름 중복되지 않게 다른 이름으로 변경
		String saveFileName = UUID.randomUUID() + extension;
		
		File targetFile = new File(fileRoot + saveFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			
			//파일 저장
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			
			//contextroot + 저장할 내부 폴더명
			jsonObj.addProperty("url", "/" + "TraballoonTiles/reviewImage" + "/" + saveFileName);
			
							//  성공시 responseCode로 seccess값 넣어줌
			jsonObj.addProperty("responseCode", "success");
		
		} catch(Exception e) {
			//저장된 파일 삭제
			FileUtils.deleteQuietly(targetFile);
			
			jsonObj.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String uploadSummernoteImageFile = jsonObj.toString();
		
//		model.addAttribute("a", a);
//		return "redirect:/reviewwrite.do";
		System.out.println("context-path : " + contextPath);
        System.out.println("upLoadImage uploadSummernoteImageFile : " + uploadSummernoteImageFile);
		return uploadSummernoteImageFile;
	}

	
	
	
	//readcountOrder
	@GetMapping(value="readcountOrder.do")
	public String readcountOrder(ReviewParam param, ReviewDto dto, Model model) {
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		List<ReviewDto> readcountOrder = service.readcountOrder(dto);
		
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
			
			model.addAttribute("review", readcountOrder);	// 게시판 리스트
			model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
			model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
			model.addAttribute("choice", param.getChoice());	// 검색 카테고리
			model.addAttribute("search", param.getSearch());	// 검색어
			
		return "review";
	}
	
	
	
	
	
	
	
	//wdateOrder
	@GetMapping(value="wdateOrder.do")
	public String wdateOrder(ReviewParam param, ReviewDto dto, Model model) {
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		List<ReviewDto> wdateOrder = service.wdateOrder(dto);
		
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
		
		model.addAttribute("review", wdateOrder);	// 게시판 리스트
		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어	
		
		return "review";
	}
	
	
	
	
	
	
	
	
	
	
	//wdateOrder
	@GetMapping(value="longdateOrder.do")
	public String longdateOrder(ReviewParam param, ReviewDto dto, Model model) {
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20 
		
		param.setStart(start);
		param.setEnd(end);
		List<ReviewDto> longdateOrder = service.wdateOrder(dto);
		
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
		
		model.addAttribute("review", longdateOrder);	// 게시판 리스트
		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어	
		
		return "review";
	}
	
	
	
	//reviewUpdate
	@GetMapping(value="reviewUpdate.do")
	public String reviewUpdate(Model model, int seq) {
		ReviewDto dto = service.getReview(seq);
		model.addAttribute("dto", dto);
		
		return "reviewUpdate";
	}
	
	
	//reviewDelete
	@GetMapping(value="reviewDelete.do")
	public String reviewDelete(Model model, int seq) {
		boolean b = service.reviewDelete(seq);
		String reviewDelete = "REVIEW_DELETE_YES";
		if(b == false) {
			reviewDelete = "REVIEW_DELETE_NO";
		}
		model.addAttribute("reviewDelete", reviewDelete);
		return "redirect:/review.do";
	}
	
	
	
	//reviewUpdateAf
	@PostMapping(value="reviewUpdateAf.do")
	public String reviewUpdateAf(Model model, ReviewDto dto) {
		boolean isS = service.reviewUpdate(dto);
		String reviewUpdate = "REVIEW_UPDATE_OK";
		if(isS == false) {
			reviewUpdate = "REVIEW_UPDATE_NO";
		}
		
		model.addAttribute("reviewUpdate", reviewUpdate);
		
		return "redirect:/review.do";
	}
	
	
	
	
	
	
	//답글(사용할지 말지 고민중)
	@GetMapping(value = "reviewAnswer.do")
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
