package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.dto.MypageDto;
import mul.cam.a.dto.MypageParam;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

public interface MypageService {
	
	// 멤버 리스트로 뿌리기
	List<MypageDto> allMember();
	
	List<MypageDto> allWriteme();
	
	List<CommunityDto> communityList(CommunityParam community);	
	int getAllCommunity(CommunityParam community);
	
	//리스트 뿌리기
	List<ReviewDto> review(ReviewParam Param);
	int getAllReview(ReviewParam Param);
}
