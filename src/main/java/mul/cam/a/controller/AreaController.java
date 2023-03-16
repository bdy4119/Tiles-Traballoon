package mul.cam.a.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mul.cam.a.dto.AreaDto;
import mul.cam.a.service.AreaService;

@Controller
public class AreaController {

	
	@Autowired 
	AreaService service;
	 
	
	@GetMapping(value = "localtravel.do")
	public String localtravel(HttpServletRequest req, Model model) { 
		System.out.println("AreaController localtravel() " + new Date());
		
		List<AreaDto> list = service.arealist();	//사진으로 뿌리기 
		model.addAttribute("arealist", list);
		return "localtravel";
	}
	
	@GetMapping(value = "localtravel2.do")
	public String localtravel2(Model model, int areacode) {/* areacode가지고 이동 */
		System.out.println("AreaController place() " + new Date());
		
		AreaDto dto = service.getAreacode(areacode);
		model.addAttribute("areadto", dto);
		
		return "localtravel2";
	}
	
	@GetMapping(value = "place.do")
	public String place(HttpServletRequest req, Model model) {
		System.out.println("AreaController place() " + new Date());

		List<AreaDto> list = service.arealist();	//사진으로 뿌리기 
		model.addAttribute("arealist", list);
		return "place";
	}
}
 