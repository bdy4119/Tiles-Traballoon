package mul.cam.a.controller;

import mul.cam.a.dto.TripDto;
import mul.cam.a.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
public class TripController {

    @Autowired
    TripService service;

    @GetMapping(value = "trip.do")
    public String trip(){
        return "trip";
    }

    @GetMapping(value = "tripcity.do")

    public String tripcity(HttpServletRequest req, Model model, HttpSession session){
        String name = req.getParameter("name");
        List<TripDto> list = service.triplist(name);
        model.addAttribute("triplist", list);
        model.addAttribute("City", name);

        String adminId = (String) session.getAttribute("id");
        System.out.println(adminId);
        return "triplist";
    }

    @GetMapping(value = "tripadmin.do")
    public String tripadmin(Model model){
        List<TripDto> list = service.tripAllList();
        model.addAttribute("tripadminlist", list);
        return "tripadminlist";
    }

    @GetMapping(value = "tripwrite.do")
    public String tripwrite() {
        return "tripwrite";
    }

    @PostMapping(value = "tripwriteAf.do")
    public String tripwriteAf(Model model, TripDto dto) {
        boolean isS = service.writeTrip(dto);
        List<TripDto> list = service.tripAllList();
        String tripwrite = "";
        if(isS) {
            tripwrite = "TRIP_ADD_OK";
        }else {
            tripwrite = "TRIP_ADD_NG";
        }
        model.addAttribute("tripwrite", tripwrite);
        model.addAttribute("tripadminlist", list);

        System.out.println("Image upload success : " + dto.getContent());

        return "redirect:/tripadmin.do";
    }

    @GetMapping (value = "tripdetail.do")
    public String tripdetail(Model model, int seq) {
        TripDto dto = service.getTrip(seq);
        model.addAttribute("tripdto", dto);

        return "tripdetail";
    }

}
