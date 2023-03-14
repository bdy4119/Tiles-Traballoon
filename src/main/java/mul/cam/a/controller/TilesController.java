package mul.cam.a.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TilesController {
	
	@GetMapping(value = "main.do")		
	public String login() {			//layouts.xml의 definition 안 login을 뜻함
		System.out.println("TilesController login() " + new Date());
		
		return "main";
	}
	
	/*
	 * @GetMapping(value = "bbslist.do") public String bbslist() {
	 * System.out.println("TilesController bbslist() " + new Date());
	 * 
	 * return "bbslist"; }
	 */
	
	
	
	/* 지역별 여행 - 재훈 */
	@GetMapping("localtravel.do")
    public String localtravel() {
		System.out.println("TilesController localtravel() " + new Date());
		
        return "localtravel";
    }
	@GetMapping(value = "gyeonggi.do")
	public String gyeonggi()
	/* (Model model, int seq) */ {
		/*
		 * LocalDto dto = service.getLocal(seq); model.addAttribute("localdto", dto);
		 */
		return "gyeonggi";
	}
	
	@GetMapping(value = "jeju.do")
	public String jeju() {
		return "jeju";
	}
	
	@GetMapping(value = "gangwon.do")
	public String gangwon() {
		return "gangwon";
	}
	
	@GetMapping(value = "chungbuk.do")
	public String chungbuk() {
		return "chungbuk";
	}
	@GetMapping(value = "chungnam.do")
	public String chungnam() {
		return "chungnam";
	}
	@GetMapping(value = "jeonbuk.do")
	public String jeonbuk() {
		return "jeonbuk";
	}
	@GetMapping(value = "jeonnam.do")
	public String jeonnam() {
		return "jeonnam";
	}
	@GetMapping(value = "gyeongbuk.do")
	public String gyeongbuk() {
		return "gyeongbuk";
	}
	
	@GetMapping(value = "gyeongnam.do")
	public String gyeongnam() {
		return "gyeongnam";
	}
	/* 지역별 여행 - 재훈 */
	
	@GetMapping("hotel.do")
    public String hotel() {
		System.out.println("TilesController hotel() " + new Date());
		
        return "hotel";
    }
	
//	@GetMapping("reviewPage.do")
//    public String review() {
//		System.out.println("TilesController reviewPage() " + new Date());
//		
//        return "reviewPage";
//    }
	
	@GetMapping("community.do")
    public String community() {
		System.out.println("TilesController community() " + new Date());
		
        return "community";
    }
	
	@GetMapping("mypage.do")
    public String mypage() {
		System.out.println("TilesController mypage() " + new Date());
		
        return "mypage";
    }
	
	@GetMapping("login.do")
    public String loginpage() {
		System.out.println("TilesController login() " + new Date());
		
        return "login";
    }
}
