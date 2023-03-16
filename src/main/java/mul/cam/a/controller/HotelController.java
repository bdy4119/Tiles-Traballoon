package mul.cam.a.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.cam.a.dto.HotelCommentDto;
import mul.cam.a.dto.HotelDto;
import mul.cam.a.service.HotelService;

@Controller
public class HotelController {
	/* 카테고리 메뉴 클릭시 해당 메뉴로 이동------------------------------------- */

	@Autowired
	HotelService service;

	
/*1페이지(호텔페이지)--------------------------------------------------------*/
// List<HotelDto>로 도착
	// 1. 호텔 정보 받기 + 페이징 + 정렬 
	@GetMapping("hotel.do")
	public String hotel(@RequestParam(name="page", defaultValue="1") int page,	//페이징
			@RequestParam(name="totalCount", defaultValue="10") int totalCount,	//페이징
			
			@RequestParam(name="orderBy", defaultValue = "") String orderBy,	//정렬
			HttpServletRequest req, Model model) {
		
		List<HotelDto> list = service.hotellist(orderBy); 
		model.addAttribute("hotellist", list);		// 사진 뿌리기 위해 보냄
		
		model.addAttribute("page", page);			// 페이징
		model.addAttribute("totalCount", 10);		// 페이징
		model.addAttribute("pageTitle", "숙소 추천");	// 배경사진 제목 보내기
		model.addAttribute("pageDescription", "당신의 아름다운 하루를 즐겨보세요");	//배경사진 부제목 보내기
		
		return "hotel";

		/*
		 * int pn = param.getPageNumber(); // 0 1 2 3 4 로 넘어옴 int start = 1 + pn * 9;
		 * //15개 보여주고 싶으면 15로 바꾸기 -> 1 11 21 int end = (pn + 1) * 9; //0이라면 (0 +1) *10
		 * -> 10, 20, 30, 40~
		 * 
		 * param.setStart(start); param.setEnd(end);
		 * 
		 * List<HotelDto> list = service.hotellist(param); //서비스의 메서드 호출하여 게시판목록 불러옴 int
		 * len = service.getHotelsPaging(param); //서비스의 메서드 호출하여 총글의 개수 불러옴
		 * 
		 */

	}
	 
	  @RequestMapping(value = "menu_seoul.do", method = RequestMethod.GET) public
	  String menuSeoul() {
	  
		  
	//3. 메뉴로 보내기
	  return "hotel/menu_seoul"; }
	  
	  @RequestMapping(value = "menu_gwd.do", method = RequestMethod.GET) public
	  String menuGwd() {
	  
	  return "hotel/menu_gwd"; }
	  
	  @RequestMapping(value = "menu_ccd.do", method = RequestMethod.GET) public
	  String menuCcd() {
	  
	  return "hotel/menu_ccd"; }
	  
	  @RequestMapping(value = "menu_gsd.do", method = RequestMethod.GET) public
	  String menuGsd() {
	  
	  return "hotel/menu_gsd"; }
	  
	  @RequestMapping(value = "menu_jld.do", method = RequestMethod.GET) public
	  String menuJld() {
	  
	  return "hotel/menu_jld"; }
	  
	  @RequestMapping(value = "menu_jeju.do", method = RequestMethod.GET) public
	 String menuJeju() {
	  
	  return "hotel/menu_jeju"; }

	  
/*2페이지(호텔 상세페이지)----------------------------------------------------------*/
	  
	  //숙소 상세화면 
	  //a태그로 보내면 Get으로 받는다.	
	  @GetMapping("hoteldetail.do") 
	  public String hoteldetail(Model model, int seq) { 
		  HotelDto hoteldto = service.getHotel(seq);	
		  String photo = hoteldto.getThumbnail();
		  //Cannot invoke "mul.cam.a.dto.HotelDto.getSeq()" because "hoteldto" is null
		  model.addAttribute("hoteldto", hoteldto);
		  model.addAttribute("photo", photo);
		  return "hoteldetail"; } 
	  
	  //댓글
		@PostMapping(value = "HotelcommentWriteAf.do")
		public String HotelcommentWriteAf(HotelCommentDto com) {
			boolean isS = service.HotelcommentWrite(com);
			if(isS) {
				System.out.println("댓글작성에 성공했습니다");
			}else {
				System.out.println("댓글작성에 실패했습니다");
			}
			
			//작성 성공해도 실패해도 bbsdetail페이지로 보내기 
			//bbsdetail.do는 seq를 받는 controller이기 때문에 seq를 같이 보내준다.
			return "redirect:/hoteldetail.do?seq=" + com.getHotelSeq();
			// seq번호가 3일때 주소 =  :/bbsdetail.do?seq=3   
		}
		
		// 댓글을 화면에 뿌려주기
		// 어디를 클릭했을 때 뿌려주는게 아니라 무조건 뿌려져있게 하는것!
		// ex) 댓글 보기 버튼 이런거 클릭하는게 아니라 게시판 들어올때 이미 댓글이 표시되어있음.
		// -> 들어올때 ajax로 갖고와서 뿌리는 방법 (bbsdetail에 작성)
		
		@ResponseBody //@ResponseBody : ajax 
		@GetMapping(value = "HotelcommentList.do")
		public List<HotelCommentDto> HotelcommentList(@RequestParam("seq") int hotelseq){
			List<HotelCommentDto> list = service.HotelcommentList(hotelseq);
			return list; // list로 리턴할 수 있다!
		}
		
	}


