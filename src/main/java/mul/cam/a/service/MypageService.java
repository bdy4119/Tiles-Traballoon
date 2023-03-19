package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.dto.MypageDto;
import mul.cam.a.dto.MypageParam;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

public interface MypageService {

	List<MypageDto> mypageCommunitylist(MypageParam community);	
	int getAllmypageCommunity(MypageParam community);
	
	List<MypageDto> allMember();
	
	MypageDto info(MypageDto dto);
	
	List<MypageDto> allWriteme();
	
	
}
