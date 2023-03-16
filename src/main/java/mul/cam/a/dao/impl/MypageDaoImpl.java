package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.MypageDao;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.MypageDto;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Autowired
	SqlSession session;
	
	String ns = "member.";
	
	public List<MypageDto> allMember() {
		
		return session.selectList(ns + "allMember");
	}
}
