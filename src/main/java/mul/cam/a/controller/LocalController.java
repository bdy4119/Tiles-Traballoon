package mul.cam.a.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import mul.cam.a.dto.LocalDto;
import mul.cam.a.service.LocalService;

public class LocalController {
	@Autowired
	LocalService service;
	
	
}
