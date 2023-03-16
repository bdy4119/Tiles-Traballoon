package mul.cam.a.dao;

import mul.cam.a.dto.CommunityComment;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;

import java.util.List;

public interface CommunityDao {

	List<CommunityDto> communitylist(CommunityParam community);	
	int getAllCommunity(CommunityParam community);
	
	int writeCommunity(CommunityDto dto);
	
	CommunityDto getCommunity(int seq);
	
	int updateCommunity(CommunityDto dto);
	
	int answerCommunityUpdate(CommunityDto dto);
	int answerCommunityInsert(CommunityDto dto);
	
	// 댓글
	int commentWrite(CommunityComment community);	
	List<CommunityComment> commentList(int seq);
}



