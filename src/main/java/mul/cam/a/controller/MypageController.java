package mul.cam.a.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mul.cam.a.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService service;
	
	@GetMapping(value = "mypage.do")
	public String mypage() {
		System.out.println("MypageController mypage " + new Date());
		return "mypage";
	}
	@GetMapping(value = "mypageAf.do")
	public String mypageAf() {
		
		return "mypageAf";
	}
	@GetMapping(value = "wishlist.do")
	public String wishlist() {
		
		return "wishlist";
	}
	
	@GetMapping(value = "order.do")
	public String order() {
		
		return "order";
	}
	@GetMapping(value = "writeme.do")
	public String writeme() {
		
		return "writeme";
	}

	
	@GetMapping(value = "reference.do")
	public String reference() {
		
		return "reference";
	}

	@GetMapping(value = "leave.do")
	public String leave() {
		
		return "leave";
	}
}
