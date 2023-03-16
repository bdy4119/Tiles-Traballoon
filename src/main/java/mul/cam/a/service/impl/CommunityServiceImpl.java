package mul.cam.a.service.impl;

import mul.cam.a.dao.CommunityDao;
import mul.cam.a.dto.CommunityComment;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import mul.cam.a.service.CommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	CommunityDao dao;

	@Override
	public List<CommunityDto> communitylist(CommunityParam community) {		
		return dao.communitylist(community);
	}

	@Override
	public int getAllCommunity(CommunityParam community) {		
		return dao.getAllCommunity(community);
	}

	@Override
	public boolean writeCommunity(CommunityDto dto) {
		int n = dao.writeCommunity(dto);
		return n>0?true:false;
	}

	@Override
	public CommunityDto getCommunity(int seq) {		
		return dao.getCommunity(seq);
	}

	@Override
	public boolean updateCommunity(CommunityDto dto) {
		int n = dao.updateCommunity(dto); 
		return n>0?true:false;
	}

	@Override
	public boolean answerCommunity(CommunityDto dto) {
		dao.answerCommunityUpdate(dto);
		int n = dao.answerCommunityInsert(dto);
		return n>0?true:false;
	}

	@Override
	public boolean commentWrite(CommunityComment community) {
		int n = dao.commentWrite(community);
		return n>0?true:false;
	}

	@Override
	public List<CommunityComment> commentList(int seq) {		
		return dao.commentList(seq);
	}	
		
	
}

