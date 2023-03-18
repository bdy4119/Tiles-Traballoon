package mul.cam.a.dao.impl;

import mul.cam.a.dao.CommunityDao;
import mul.cam.a.dto.CommunityComment;
import mul.cam.a.dto.CommunityDto;
import mul.cam.a.dto.CommunityParam;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Autowired
	SqlSession session;
	
	String ns = "Community.";

	@Override
	public List<CommunityDto> communitylist(CommunityParam community) {		
		return session.selectList(ns + "communitylist", community);
	}

	@Override
	public int getAllCommunity(CommunityParam community) {		
		return session.selectOne(ns + "getAllCommunity", community);
	}
	
	
	//조회수 증가
	@Override
	public int comReadcount(int seq) {
		return session.update(ns + "comReadcount", seq);
	}
	
	//조회수순 정렬
	@Override
	public List<CommunityDto> comReadcountOrder(CommunityDto dto) {
		return session.selectList(ns + "comReadcountOrder", dto);
	}

	@Override
	public int writeCommunity(CommunityDto dto) {		
		return session.insert(ns + "writeCommunity", dto);
	}

	@Override
	public CommunityDto getCommunity(int seq) {		
		return session.selectOne(ns + "getCommunity", seq);
	}

	@Override
	public int updateCommunity(CommunityDto dto) {	
		return session.update(ns + "updateCommunity", dto);
	}
	
	//글삭제
	@Override
	public int communitydelete(int seq) {
		return session.update(ns + "communitydelete", seq);
	}

	@Override
	public int answerCommunityUpdate(CommunityDto dto) {		
		return session.update(ns + "answerCommunityUpdate", dto);
	}

	@Override
	public int answerCommunityInsert(CommunityDto dto) {		
		return session.insert(ns + "answerCommunityInsert", dto);
	}

	@Override
	public int commentWrite(CommunityComment community) {		
		return session.insert(ns + "commentWrite", community);
	}

	@Override
	public List<CommunityComment> commentList(int seq) {		
		return session.selectList(ns + "commentList", seq);
	}

}





