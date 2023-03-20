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

    @PostMapping (value = "tripadmin.do")
    public String tripadmin(@RequestParam("admin") String admin, Model model){
        List<TripDto> list = service.tripAllList();
        model.addAttribute("tripadminlist", list);
        return "tripadminlist";
    }

    @PostMapping(value = "tripwrite.do")
    public String tripwrite(@RequestParam("admin") String admin) {
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
        int tripReadcount = service.tripReadcount(seq);

        model.addAttribute("tripdto", dto);
        model.addAttribute("readcount", tripReadcount);

        return "tripdetail";
    }

    @GetMapping(value = "tripupdate.do")
    public String tripupdate(Model model, int seq) {
        TripDto dto = service.getTrip(seq);
        model.addAttribute("dto", dto);

        return "tripupdate";
    }


    //글삭제
    @GetMapping(value="tripdelete.do")
    public String tripdelete(Model model, int seq) {
        boolean b = service.tripdelete(seq);
        String tripdelete = "TRIP_DELETE_OK";
        if(b == false) {
            tripdelete = "TRIP_DELETE_NO";
        }
        model.addAttribute("tripdelete", tripdelete);
        return "tripmessage";
    }


    @GetMapping(value = "tripupdateAf.do")
    public String tripupdateAf(Model model, TripDto dto) {
        System.out.println(dto.toString());
        boolean isS = service.updateTrip(dto);

        String tripupdate = "TRIP_UPDATE_OK";
        if(!isS) {
            tripupdate = "TRIP_UPDATE_NG";
        }
        model.addAttribute("tripupdate", tripupdate);
        model.addAttribute("seq", dto.getSeq());

        return "tripmessage";
    }

}
