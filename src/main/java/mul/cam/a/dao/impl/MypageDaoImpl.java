package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.MypageDao;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.MypageDto;
import mul.cam.a.dto.MypageParam;
import mul.cam.a.dto.ReviewDto;
import mul.cam.a.dto.ReviewParam;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	SqlSession session;
	
	String ns = "mypage.";
	
	@Override
	public List<MypageDto> mypageCommunitylist(MypageParam community) {
			return session.selectList(ns + "communitylist", community);
	}
	@Override
	public int getAllmypageCommunity(MypageParam community) {		
		return session.selectOne(ns + "getAllCommunity", community);
	}
	
	@Override
	public List<MypageDto> allMember() {
		
		return session.selectList(ns + "allMember");
	}
	
	// login 정보를 dto에 담는다 
	// mem 은 세션에서 선택된 login + dto 정보를 담는다
	@Override
	public MypageDto info(MypageDto dto) {
		MypageDto info = session.selectOne(ns + "info" + dto);
		return info;
	}
	
	@Override
	public List<MypageDto> allWriteme(){
		return session.selectList(ns + "allWriteme"); 
	}
}
