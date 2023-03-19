package mul.cam.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.MypageDto;
import mul.cam.a.dto.MypageParam;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;
import mul.cam.a.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService service;
	
	@PostMapping(value = "mypageCommunityAf.do")
	public String mypageCommunitylist(MypageParam param, Model model) {
		System.out.println("MypageController mypageCommunityAf " + new Date());
		
		// 글의 시작과 끝
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20

		param.setStart(start);
		param.setEnd(end);

		List<MypageDto> list = service.mypageCommunitylist(param);
		int len = service.getAllmypageCommunity(param);
		
		
		
		int pageCommunity = len / 10;		// 25 / 10 -> 2
		if((len % 10) > 0) {
			pageCommunity = pageCommunity + 1;
		}

		if(param.getChoice() == null || param.getChoice().equals("")
			|| param.getSearch() == null || param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}

		model.addAttribute("mypageCommunitylist", list);	// 게시판 리스트
		model.addAttribute("pageCommunity", pageCommunity);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어

		return "mypageCommunityAf";
	}
	@GetMapping(value = "mypage.do")
	public String mypage(MemberDto dto) {
		System.out.println("MypageController mypageAf " + new Date());
		return "mypage";
	}
	
	@GetMapping(value = "mypageWriteme.do")
	public String mypageWriteme() {
		
		return "mypageWriteme";
	}
	
	@GetMapping(value = "mypageLeave.do")
	public String mypageLeave() {
		
		return "mypageLeave";
	}
	
	@GetMapping(value = "NewFile.do")
	public String NewFile() {
		
		return "NewFile";
	}
	
	@GetMapping(value = "mypageAf.do")
	public String mypageAf(MemberDto dto) {
		System.out.println("MypageController mypageAf " + new Date());
		return "mypageAf";
	}
	
	@GetMapping(value = "mypageWishlist.do")
	public String mypageWishlist() {
		
		return "mypageWishlist";
	}
	@GetMapping(value = "mypagehotel.do")
	public String mypagehotel() {
		
		return "mypagehotel";
	}
	@GetMapping(value = "mypageTrip.do")
	public String mypageTrip() {
		
		return "mypageTrip";
	}
	
	@GetMapping(value = "mypageOrder.do")
	public String mypageOrder() {
		
		return "mypageOrder";
	}

	@GetMapping(value = "mypageRefence.do")
	public String mypageRefence() {
		
		return "mypageRefence";
	}
	
	// 어떤 view에서든 allWriteme.do 를 호출하면 이쪽으로 접근
	@ResponseBody	// view와 컨트롤러끼리 통신(비동기통신) refresh없이 ajax쓸 때 필요
	@GetMapping(value = "allWriteme.do")
	public List<MypageDto> allWriteme(String id, Model model) {
		System.out.println("allWriteme" + new Date());
//		dto에서부터 가져온 db의 정보를 겟 
		List<MypageDto> list = service.allWriteme();
		System.out.println(list);
//		model에 list를 담아 보냄
		model.addAttribute("list", list);
		return service.allWriteme();
	}
	@GetMapping(value = "mypageReviewAf.do")
	public String mypageReviewAf() {
		
		return "mypageReviewAf";
	}
	
	@GetMapping(value = "mypageCommunityAf.do")
	public String mypageCommunityAf() {
		
		return "mypageCommunityAf";
	}
	
//	@GetMapping(value = "allWriteme.do")
//	public String allWriteme(int seq, Model model) {
//		List<MypageDto> list = service.allWriteme();
//		
//		model.addAttribute("list", list);
//		return "mypageReviewAf";
//	}
}
