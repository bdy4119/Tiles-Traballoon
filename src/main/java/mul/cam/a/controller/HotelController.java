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
import mul.cam.a.dto.HotelPagingDto;
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
			@RequestParam(name="orderBy", defaultValue = "") String orderBy,	//정렬
			HttpServletRequest req, Model model) {
		HotelPagingDto pagingDto = new HotelPagingDto();		//페이징
		pagingDto.setOrderBy(orderBy);
		pagingDto.setPageNo(page);
		pagingDto.setViewCount(99);
		pagingDto.setLimit((page - 1) * pagingDto.getViewCount());	
		
		List<HotelDto> list = service.hotellist(pagingDto); 	// 페이징 된 list
		model.addAttribute("hotellist", list);					// 사진 뿌리기 위해 보냄
		model.addAttribute("orderBy", orderBy);					// 정렬
		model.addAttribute("pageTitle", "Hotel Traballoon");	// 배경사진 제목 보내기
		model.addAttribute("pageDescription", "당신의 아름다운 하루를 즐겨보세요");	//배경사진 부제목 보내기
		
		int totalCount = service.getHotelTotalCount();	//hotels 테이블 총 개수 얻어오기
		model.addAttribute("page", page);				// 페이징
		model.addAttribute("totalCount", totalCount);	// 페이징

		return "hotel";

	}

	 //2. 메뉴(사이드바)에서 사진 뿌리기
		@GetMapping(value = {"menu_sudo.do", "menu_gwd.do", "menu_ccd.do", "menu_gsd.do", "menu_jld.do", "menu_jeju.do"})
		public String menu(@RequestParam(name="page", defaultValue="1") int page,
				@RequestParam(name="orderBy", defaultValue = "") String orderBy,
		                   HttpServletRequest req, Model model) {
			
			HotelPagingDto pagingDto = new HotelPagingDto();		//페이징
			pagingDto.setOrderBy(orderBy);
			pagingDto.setPageNo(page);
			pagingDto.setViewCount(99);
			pagingDto.setLimit((page - 1) * pagingDto.getViewCount());	
			
			List<HotelDto> list = service.hotellist(pagingDto); 	// 페이징 된 list
			model.addAttribute("hotellist", list);					// 사진 뿌리기 위해 보냄
			model.addAttribute("orderBy", orderBy);					// 정렬
			model.addAttribute("pageTitle", "Hotel Traballoon");	// 배경사진 제목 보내기
			model.addAttribute("pageDescription", "당신의 아름다운 하루를 즐겨보세요");	//배경사진 부제목 보내기
			
			int totalCount = service.getHotelTotalCount();	//hotels 테이블 총 개수 얻어오기
			model.addAttribute("page", page);				// 페이징
			model.addAttribute("totalCount", totalCount);	// 페이징
	
		    String uri = req.getRequestURI();
		    String menu = uri.substring(uri.lastIndexOf('/') + 1);

		    if (menu.equals("menu_sudo.do")) {
		        return "menu_sudo";
		    } else if (menu.equals("menu_gwd.do")) {
		        return "menu_gwd";
		    } else if (menu.equals("menu_ccd.do")) {
		        return "menu_ccd";
		    } else if (menu.equals("menu_gsd.do")) {
		        return "menu_gsd";
		    } else if (menu.equals("menu_jld.do")) {
		        return "menu_jld";
		    } else if (menu.equals("menu_jeju.do")) {
		        return "menu_jeju";
		    }

		    return "error"; // 처리할 수 없는 url 패턴일 경우, 에러 페이지로 이동
		}
		
	//3. 조회수 증가
		
/*2페이지(호텔 상세페이지)----------------------------------------------------------*/
	  
	  //숙소 상세화면으로 가기 (a태그로 보내면 Get으로 받는다.)	
	  @GetMapping("hoteldetail.do") 
	  public String hoteldetail(Model model, int seq) { 
		  HotelDto hoteldto = service.getHotel(seq);	
		  String hotelname = hoteldto.getHotel_name();
		  String hotelbook = hoteldto.getBook();
		  String photo = hoteldto.getThumbnail();
		  String hotelmap = hoteldto.getMap();
		  String hotelcontent = hoteldto.getContent();
		  model.addAttribute("pageTitle", "Hotel Traballoon");				// 배경사진 제목 보내기
		  model.addAttribute("pageDescription", "당신의 아름다운 하루를 즐겨보세요");	//배경사진 부제목 보내기
		  
		  service.updateReadCount(seq);		//조회수 증가시키기
		  
		  model.addAttribute("hoteldto", hoteldto);
		  model.addAttribute("hotelname", hotelname);
		  model.addAttribute("hotelbook", hotelbook);
		  model.addAttribute("photo", photo);
		  model.addAttribute("hotelmap", hotelmap);
		  model.addAttribute("hotelcontent", hotelcontent);
		  return "hoteldetail"; 
		  } 
	  
	  //댓글 등록하기 
	  @PostMapping(value = "HotelcommentWriteAf.do")
	  public String HotelcommentWriteAf(HotelCommentDto com) {
		  boolean isS = service.HotelcommentWrite(com);
		  if(isS) {
				System.out.println("댓글작성에 성공했습니다");
		  }else {
				System.out.println("댓글작성에 실패했습니다");
			}
		  return "redirect:/hoteldetail.do?seq=" + com.getHotelSeq();
			//작성 성공해도 실패해도 hoteldetail페이지로 보내기 
			//hoteldetail.do는 seq를 받는 controller이기 때문에 seq를 같이 보내준다.
		}
	  
	  // 댓글을 화면에 뿌려주기
	  // 댓글은 버튼 클릭했을 때 뿌려주는게 아니라 hoteldetail 페이지에 들어오는 순간무조건 뿌려져있어야 한다.
	  // -> ajax 이용한다.
		@ResponseBody //@ResponseBody : ajax 
		@GetMapping(value = "HotelcommentList.do")
		public List<HotelCommentDto> HotelcommentList(@RequestParam("seq") int hotelseq){
			List<HotelCommentDto> list = service.HotelcommentList(hotelseq);
			return list; // list로 리턴할 수 있다!
		}
	}