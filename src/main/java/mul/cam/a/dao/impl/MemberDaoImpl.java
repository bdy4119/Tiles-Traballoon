package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.MemberDao;
import mul.cam.a.dto.MemberDto;

@Repository // == 저장소
public class MemberDaoImpl implements MemberDao {
	// MyBatis 접근(생성)
	@Autowired  // 자동생성
	SqlSession session;
	
	String ns = "Member.";
	
	// interface에서 상속받은 daoimpl에서 dao에서 제시한 함수를 가지고있어야한다 
	// 
	@Override
	public List<MemberDto> allMember() {						
		return session.selectList(ns + "allMember");	// sql세션의 세션이다 . session list = 
	}

	@Override
	public int idCheck(String id) {		
		return session.selectOne(ns + "idcheck", id);
	}

	@Override
	public int addMember(MemberDto dto) {		
		return session.insert(ns + "addmember", dto);		
	}

	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto mem = session.selectOne(ns + "login", dto);
		return mem;
	}

	@Override
	public int deleteMember(String id) {
		 return session.delete(ns + "deleteMember", id);
	}
	
	@Override
	public int updateMember(MemberDto dto) {
		return session.update(ns + "updateMember", dto);
	}
	
	@Override
	public MemberDto info(String id) {
		MemberDto info = session.selectOne(ns + "info", id);
		return info;
	}
}




