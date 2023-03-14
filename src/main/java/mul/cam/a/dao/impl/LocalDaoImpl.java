package mul.cam.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.LocalDao;
import mul.cam.a.dto.LocalDto;

@Repository
public class LocalDaoImpl implements LocalDao{
	@Autowired
	SqlSession session;
	
	String ns = "Local.";
	

	@Override
	public LocalDto getLocal(int seq) {
		return session.selectOne(ns + "getLocal", seq);
	}
}
