package mul.cam.a.controller;

import mul.cam.a.dto.TripDto;
import mul.cam.a.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
    public String tripcity(HttpServletRequest req, Model model){
        String name = req.getParameter("name");
        System.out.println(name);
        List<TripDto> list = service.triplist(name);
        for (TripDto tripdto : list) {
            System.out.println(tripdto.getCity() + ", " + tripdto.getContent());
        }
        model.addAttribute("triplist", list);
        model.addAttribute("City", name);
        return "triplist";
    }

}
