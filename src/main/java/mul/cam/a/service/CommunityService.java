package mul.cam.a.service;

import mul.cam.a.dto.CommunityComment;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;

import java.util.List;

public interface CommunityService {

	List<CommunityDto> communitylist(CommunityParam community);	
	int getAllCommunity(CommunityParam community);
	
	boolean writeCommunity(CommunityDto dto);
	
	CommunityDto getCommunity(int seq);
	
	boolean updateCommunity(CommunityDto dto);
	
	boolean answerCommunity(CommunityDto dto);
	
	boolean commentWrite(CommunityComment community);
	List<CommunityComment> commentList(int seq);
}
