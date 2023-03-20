package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.dto.MypageDto;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;
public interface MypageDao {

	
	List<MypageDto> allMember();
	
//	리스트로 뿌리기
	List<MypageDto> allWriteme();
	
					//	mypageCommunitylist
	List<CommunityDto> communityList(CommunityParam community);	
	int getAllCommunity(CommunityParam community);
	
	List<ReviewDto> review(ReviewParam Param);	
	int getAllReview(ReviewParam Param);
}