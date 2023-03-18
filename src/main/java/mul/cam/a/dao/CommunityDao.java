package mul.cam.a.dao;

import mul.cam.a.dto.CommunityComment;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;

import java.util.List;

public interface CommunityDao {

	List<CommunityDto> communitylist(CommunityParam community);	
	int getAllCommunity(CommunityParam community);
	
	//조회수 증가
	int comReadcount(int seq);

	//조회수순 정렬
	List<CommunityDto> comReadcountOrder(CommunityDto dto);	
	
	int writeCommunity(CommunityDto dto);
	
	CommunityDto getCommunity(int seq);
	
	int updateCommunity(CommunityDto dto);
	
	//글삭제
	int communitydelete(int seq);
	
	int answerCommunityUpdate(CommunityDto dto);
	int answerCommunityInsert(CommunityDto dto);
	
	// 댓글
	int commentWrite(CommunityComment community);	
	List<CommunityComment> commentList(int seq);
}



