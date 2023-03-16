package mul.cam.a.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;


import mul.cam.a.service.LocalService;

@Controller
public class LocalController {
	@Autowired
	LocalService service;
	
	@GetMapping(value = "localtravel.do")
	public String localtravel() {
		System.out.println("TilesController localtravel() " + new Date());
		
		/*
		 * LocalDto dto = service.getLocal(seq); model.addAttribute("localdto", dto);
		 */
		
		return "localtravel";
	}
	
	@GetMapping(value = "gyeonggi.do")
	public String gyeonggi()
	/* (Model model, int seq) */ {
		/*
		 * LocalDto dto = service.getLocal(seq); model.addAttribute("localdto", dto);
		 */
		return "gyeonggi.jsp";
	}
	
	@GetMapping(value = "ggp1.do")
	public String ggp1() {
		return "ggp1";
	}
	
	@GetMapping(value = "jeju.do")
	public String jeju() {
		return "jeju.jsp";
	}
	
	@GetMapping(value = "gangwon.do")
	public String gangwon() {
		return "gangwon.jsp";
	}
	
	@GetMapping(value = "chungbuk.do")
	public String chungbuk() {
		return "chungbuk.jsp";
	}
	@GetMapping(value = "chungnam.do")
	public String chungnam() {
		return "chungnam.jsp";
	}
	@GetMapping(value = "jeonbuk.do")
	public String jeonbuk() {
		return "jeonbuk.jsp";
	}
	@GetMapping(value = "jeonnam.do")
	public String jeonnam() {
		return "jeonnam.jsp";
	}
	@GetMapping(value = "gyeongbuk.do")
	public String gyeongbuk() {
		return "gyeongbuk.jsp";
	}
	
	@GetMapping(value = "gyeongnam.do")
	public String gyeongnam() {
		return "gyeongnam.jsp";
	}
	
}
