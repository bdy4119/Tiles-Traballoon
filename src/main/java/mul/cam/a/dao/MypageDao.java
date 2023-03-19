package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.MypageDto;
import mul.cam.a.dto.MypageParam;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

public interface MypageDao {

	List<MypageDto> allMember();
	
	MypageDto info(MypageDto dto);
	
//	리스트로 뿌리기
	List<MypageDto> allWriteme();
	
	List<MypageDto> mypageCommunitylist(MypageParam community);	
	int getAllmypageCommunity(MypageParam community);
	
	
}