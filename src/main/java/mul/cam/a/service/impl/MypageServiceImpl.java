package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.MypageDao;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.MypageDto;
import mul.cam.a.dto.MypageParam;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;
import mul.cam.a.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDao dao;
	
	@Override
	public List<MypageDto> mypageCommunitylist(MypageParam community) {		
		return dao.mypageCommunitylist(community);
	}

	@Override
	public int getAllmypageCommunity(MypageParam community) {		
		return dao.getAllmypageCommunity(community);
	}
	
	@Override
	public List<MypageDto> allMember() {
		return dao.allMember();
	}
	
	@Override
	public MypageDto info(MypageDto dto) {
		return dao.info(dto);
	}
	
	@Override
	public List<MypageDto> allWriteme(){
		return dao.allWriteme();
	}
}
