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
import mul.cam.a.dto.ReferenceDto;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;
import mul.cam.a.service.CommunityService;
import mul.cam.a.service.HotelService;
import mul.cam.a.service.MemberService;
import mul.cam.a.service.MypageService;
import mul.cam.a.service.ReferenceService;
import mul.cam.a.service.ReviewService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService service;
	@Autowired
	CommunityService cs;
	@Autowired
	ReviewService rs;
	@Autowired
	HotelService hs;
	@Autowired
	ReferenceService rfs;
	@Autowired
	MemberService ms;
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
	
	@GetMapping(value = "mypageWishlist.do")
	public String mypageWishlist() {
		
		return "mypageWishlist";
	}
	
	@GetMapping(value = "mypageTrip.do")
	public String mypageTrip() {
		
		return "mypageTrip";
	}
	
	
	// 문의사항 받기
	@GetMapping(value = "addReference.do")
	public String addReference(HttpSession session, ReferenceDto dto, Model model) {
		System.out.println("addReference" + new Date());
		
		// refdto 에서 service.add~~~(dto)
		boolean isS = rfs.addReference(dto);
		String refmsg = "";
		
//		String login = (String)session.getAttribute("login");
		// 위와 같은 코드
		
		String id = (String)session.getAttribute("id");
		
		
		if(isS) {
			refmsg = "REF_ADD_YES";
		}else {
			refmsg = "REF_ADD_NO";
		}
		
		model.addAttribute("refmsg", refmsg);
		model.addAttribute("id", id);
		
		return "message";
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
	
//	@GetMapping(value = "mypageReviewAf.do")
//	public String mypageReviewAf() {
//		
//		return "mypageReviewAf";
//	}
	
//	@GetMapping(value = "mypageCommunityAf.do")
//	public String mypageCommunityAf() {
//		
//		return "mypageCommunityAf";
//	}
	@GetMapping(value = "mypagehotel.do")
	public String mypagehotel() {
		
		return "mypagehotel";
	}
	// 마이페이지 커뮤니티 리스트 뿌리기
	@GetMapping(value="mypageCommunityAf.do")
	public String community(HttpSession session, CommunityParam param, Model model,String id) {
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<CommunityDto> mcList = cs.communitylist(param);
		int len = cs.getAllCommunity(param);
		
		int pageCommunity = len / 10;		// 25 / 10 -> 2
		if((len % 10) > 0) {
			pageCommunity = pageCommunity + 1;
		}
		
		if(param.getChoice() == null || param.getChoice().equals("")
				|| param.getSearch() == null || param.getSearch().equals("")) {
				param.setChoice("검색");
				param.setSearch("");
			}
		
		model.addAttribute("mcList", mcList);	// 게시판 리스트
		model.addAttribute("pageCommunity", pageCommunity);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어
		
		return "mypageCommunityAf";
	}
	// 마이페이지 리뷰 리스트 뿌리
	@GetMapping(value="mypageReviewAf.do")
	public String review(HttpSession session, ReviewParam param, Model model,String id) {
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<ReviewDto> mrList = rs.review(param);
		int len = rs.getAllReview(param);
		
		int pageBbs = len / 10;		// 25 / 10 -> 2
		if((len % 10) > 0) {
			pageBbs = pageBbs + 1;
		}
		
		if(param.getChoice() == null || param.getChoice().equals("")
				|| param.getSearch() == null || param.getSearch().equals("")) {
				param.setChoice("검색");
				param.setSearch("");
			}
		model.addAttribute("mrList", mrList);	// 게시판 리스트
		model.addAttribute("pageBbs", pageBbs);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어
		
		return "mypageReviewAf";
	}	
//	@GetMapping(value = "allWriteme.do")
//	public String allWriteme(int seq, Model model) {
//		List<MypageDto> list = service.allWriteme();
//		
//		model.addAttribute("list", list);
//		return "mypageReviewAf";
//	}
	
	
	
	
	
	
}
