package mul.cam.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mul.cam.a.dto.PdsDto;
import mul.cam.a.dto.PdsParam;
import mul.cam.a.service.PdsService;
import mul.cam.a.util.PdsUtil;

@Controller
public class PdsController {

	@Autowired
	PdsService service;
	
	@RequestMapping(value = "pdslist.do", method = RequestMethod.GET)
	public String pdslist(Model model, PdsParam param) {
		
		if(param.getChoice() == null || param.getChoice().equals("")
			|| param.getSearch() == null || param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}
		
		List<PdsDto> list = service.pdslist(param);
		model.addAttribute("pdslist", list);
		
		return "board/pdslist";
	}
	
	@GetMapping(value = "pdswrite.do")
	public String pdswrite() {
		return "board/pdswrite";
	}
	
	@PostMapping(value = "pdsupload.do")
	public String pdsupload(PdsDto dto, 
							@RequestParam(value = "fileload", required = false)
							MultipartFile fileload,
							HttpServletRequest req) {	
		
		// filename 취득
		String filename = fileload.getOriginalFilename();	// 원본의 파일명
		
		dto.setFilename(filename);	// 원본 파일명(DB)
		
		// upload의 경로 설정
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더
	//	String fupload = "c:\\temp";
		
		System.out.println("fupload:" + fupload);
		
		// 파일명을 충돌되지 않는 명칭(Date)으로 변경
		String newfilename = PdsUtil.getNewFileName(filename);
		
		dto.setNewfilename(newfilename);	// 변경된 파일명
		
		File file = new File(fupload + "/" + newfilename);
				 
		try {
			// 실제로 파일 생성 + 기입 = 업로드
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db에 저장
			service.uploadPds(dto);
			
		} catch (IOException e) {			
			e.printStackTrace();
		}		
		
		return "redirect:/pdslist.do";
	}
	
	@PostMapping(value = "filedownLoad.do")
	public String filedownLoad(int seq, String filename, String newfilename, Model model, 
			HttpServletRequest req) {
		
		// 경로
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
				
		// 폴더
		//	String fupload = "c:\\temp";
		
		// 다운로드 받을 파일
		File downloadFile = new File(fupload + "/" + newfilename);				
		
		model.addAttribute("downloadFile", downloadFile);	// file 실제 업로드되어 있는 파일명	경로/35435345345.txt
		model.addAttribute("filename", filename);		// 원 파일명					abc.txt
		model.addAttribute("seq", seq);					// download 카운트를 증가
		
		return "downloadView";
	}
	
	@GetMapping(value = "pdsdetail.do")
	public String pdsdetail(Model model, int seq) {
		PdsDto pds = service.getPds(seq);
		model.addAttribute("pds", pds);
		
		return "board/pdsdetail";
	}
	
	@GetMapping(value = "pdsupdate.do")
	public String pdsupdate(int seq, Model model) {
		PdsDto pds = service.getPds(seq);
		model.addAttribute("pds", pds);
		
		return "board/pdsupdate";
	}
	
	@PostMapping(value = "pdsupdateAf.do")
	public String pdsupdateAf(PdsDto dto, 
							@RequestParam(value = "fileload", required = false)
							MultipartFile fileload,
							HttpServletRequest req) {
		
		String originalFileName = fileload.getOriginalFilename();
		
		if(originalFileName != null && !originalFileName.equals("")) { // 파일이 변경되었음
			
			String newfilename = PdsUtil.getNewFileName(originalFileName);
			
			dto.setFilename(originalFileName);
			dto.setNewfilename(newfilename);
			
			String fupload = req.getServletContext().getRealPath("/upload");			
			File file = new File(fupload + "/" + newfilename);
			
			try {
				// 새로운 파일로 업로드
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				// db 갱신
				service.updatePds(dto);
				
			} catch (IOException e) {				
				e.printStackTrace();
			}			
			
		}else {	// 파일 변경되지 않았음
			service.updatePds(dto);
		}
		
		return "redirect:/pdsdetail.do?seq=" + dto.getSeq();
	}
	
}











