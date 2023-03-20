package mul.cam.a.dao.impl;

import java.io.Serializable;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.ReferenceDao;
import mul.cam.a.dto.ReferenceDto;

@Repository
public class ReferenceDaoImpl implements ReferenceDao{
	
	@Autowired
	SqlSession session;
	
	String ns = "Reference.";
	
	@Override
	public int addReference(ReferenceDto dto) {
		return session.insert(ns + "addReference", dto);
	
}
}