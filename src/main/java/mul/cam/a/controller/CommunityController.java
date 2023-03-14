package mul.cam.a.controller;

import mul.cam.a.dto.CommunityComment;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommunityController {

	@Autowired
    CommunityService service;
	
	@GetMapping(value = "community.do")
	public String community(CommunityParam param, Model model) {

		// 글의 시작과 끝
		int pn = param.getPageNumber();  // 0 1 2 3 4
		int start = 1 + (pn * 10);	// 1  11
		int end = (pn + 1) * 10;	// 10 20

		param.setStart(start);
		param.setEnd(end);

		List<CommunityDto> list = service.communitylist(param);
		int len = service.getAllCommunity(param);

		int pageCommunity = len / 10;		// 25 / 10 -> 2
		if((len % 10) > 0) {
			pageCommunity = pageCommunity + 1;
		}

		if(param.getChoice() == null || param.getChoice().equals("")
			|| param.getSearch() == null || param.getSearch().equals("")) {
			param.setChoice("검색");
			param.setSearch("");
		}

		model.addAttribute("communitylist", list);	// 게시판 리스트
		model.addAttribute("pageCommunity", pageCommunity);	// 총 페이지수
		model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
		model.addAttribute("choice", param.getChoice());	// 검색 카테고리
		model.addAttribute("search", param.getSearch());	// 검색어

		return "community";
	}

	@GetMapping(value = "communitywrite.do")
	public String communitywrite() {
		return "communitywrite";
	}

	@PostMapping(value = "communitywriteAf.do")
	public String communitywriteAf(Model model, CommunityDto dto) {
		boolean isS = service.writeCommunity(dto);
		String communitywrite = "";
		if(isS) {
			communitywrite = "COMMUNITY_ADD_OK";
		}else {
			communitywrite = "COMMUNITY_ADD_NG";
		}
		model.addAttribute("communitywrite", communitywrite);

		return "redirect:/community.do";

	}
	
	@GetMapping(value = "communitydetail.do")
	public String communitydetail(Model model, int seq) {
		CommunityDto dto = service.getCommunity(seq);
		model.addAttribute("communitydto", dto);
		
		return "communitydetail";
	}
	
	@GetMapping(value = "communityupdate.do")
	public String communityupdate(Model model, int seq) {
		CommunityDto dto = service.getCommunity(seq);
		model.addAttribute("dto", dto);
		
		return "communityupdate";
	}
	
	@GetMapping(value = "communityupdateAf.do")
	public String communityupdateAf(Model model, CommunityDto dto) {
		System.out.println(dto.toString());
		boolean isS = service.updateCommunity(dto);
		
		String communityupdate = "COMMUNITY_UPDATE_OK";
		if(!isS) {			
			communityupdate = "COMMUNITY_UPDATE_NG";
		}
		model.addAttribute("communityupdate", communityupdate);
		model.addAttribute("seq", dto.getSeq());
		
		return "communitymessage";
	}
	
	@GetMapping(value = "communityanswer.do")
	public String answer(Model model, int seq) {
		CommunityDto dto = service.getCommunity(seq);
		model.addAttribute("dto", dto);
		
		return "communityanswer";
	}
	
	@PostMapping(value = "communityanswerAf.do")
	public String answerAf(Model model, int seq, CommunityDto dto) {
		dto.setSeq(seq);		
		boolean isS = service.answerCommunity(dto);
		String answer = "COMMUNITY_ANSWER_OK";
		if(isS == false) {
			answer = "COMMUNITY_ANSWER_NG";
		}
		model.addAttribute("answer", answer);
		
		return "communitymessage";
	}
	
	// 댓글
	@PostMapping(value = "communitycommentWriteAf.do")
	public String commentWriteAf(CommunityComment community) {
		boolean isS = service.commentWrite(community);
		if(isS) {
			System.out.println("댓글작성에 성공했습니다");
		}else {
			System.out.println("댓글작성에 실패했습니다");
		}
		
		return "redirect:/communitydetail.do?seq=" + community.getSeq();
	}
	
	@ResponseBody
	@GetMapping(value = "communitycommentList.do")
	public List<CommunityComment> commentList(int seq){
		List<CommunityComment> list = service.commentList(seq);
		return list;
	}
	
}







