package mul.cam.a.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TilesController {
	
	@GetMapping(value = "main.do")		
	public String main() {			//layouts.xml의 definition 안 main을 뜻함
		System.out.println("TilesController main() " + new Date());
		
		return "main";
	}
	
	/*
	 * @GetMapping(value = "bbslist.do") public String bbslist() {
	 * System.out.println("TilesController bbslist() " + new Date());
	 * 
	 * return "bbslist"; }
	 */
	@GetMapping(value = "maintraballoon.do")		
	public String maintraballoon() {			//layouts.xml의 definition 안 main을 뜻함
		System.out.println("TilesController main() " + new Date());
		
		return "maintraballoon";
	}
	
	
	
	
	/*
	 * @GetMapping("hotel.do") public String hotel() {
	 * System.out.println("TilesController hotel() " + new Date());
	 * 
	 * return "hotel"; }
	 */
//	@GetMapping("reviewPage.do")
//    public String review() {
//		System.out.println("TilesController reviewPage() " + new Date());
//		
//        return "reviewPage";
//    }
	
//	@GetMapping("communitylist.do")
//    public String community() {
//		System.out.println("TilesController community() " + new Date());
//
//        return "communitylist";
//    }
	
//	@GetMapping("mypage.do")
//    public String mypage() {
//		System.out.println("TilesController mypage() " + new Date());
//		
//        return "mypage";
//    }
	
//	@GetMapping("login.do")
//    public String loginpage() {
//		System.out.println("TilesController login() " + new Date());
//
//        return "login";
//    }
}
