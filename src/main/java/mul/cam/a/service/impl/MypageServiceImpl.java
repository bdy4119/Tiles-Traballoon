package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.CommunityDao;
import mul.cam.a.dao.MypageDao;
import mul.cam.a.dao.ReviewDao;
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
	@Autowired
	CommunityDao cd;
	@Autowired
	ReviewDao rd;
	
	@Override
	public List<MypageDto> allMember() {
		return dao.allMember();
	}
	
	@Override
	public List<MypageDto> allWriteme(){
		return dao.allWriteme();
	}
//	마이페이지 커뮤니티 리스트
	@Override
	public List<CommunityDto> communityList(CommunityParam community) {		
		return cd.communitylist(community);
	}
//	넘버
	@Override
	public int getAllCommunity(CommunityParam community) {		
		return cd.getAllCommunity(community);
	}
//	마이페이지 리뷰 리스트
	@Override
	public List<ReviewDto> review(ReviewParam Param) {
		return rd.review(Param);
	}

//	페이지 넘버
	@Override
	public int getAllReview(ReviewParam Param) {
		return rd.getAllReview(Param);
	}
}
