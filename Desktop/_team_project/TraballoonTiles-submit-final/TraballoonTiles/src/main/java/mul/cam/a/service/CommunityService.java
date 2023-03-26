package mul.cam.a.service;

import mul.cam.a.dto.CommunityComment;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;

import java.util.List;

public interface CommunityService {

	List<CommunityDto> communitylist(CommunityParam community);	
	int getAllCommunity(CommunityParam community);
	
	//조회수 증가
	int comReadcount(int seq);
	
	//조회수순 정렬
	List<CommunityDto> comReadcountOrder(CommunityDto dto);	
	
	//최신순 정렬
	List<CommunityDto> comWdateOrder(CommunityDto dto);	
	
	//오래된순 정렬
	List<CommunityDto> comLongdateOrder(CommunityDto dto);	
	
	boolean writeCommunity(CommunityDto dto);
	
	CommunityDto getCommunity(int seq);
	
	boolean updateCommunity(CommunityDto dto);
	
	//글삭제
	boolean communitydelete(int seq);
	
	boolean answerCommunity(CommunityDto dto);
	
	boolean commentWrite(CommunityComment community);
	List<CommunityComment> commentList(int seq);
}
