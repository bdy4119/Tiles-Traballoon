package mul.cam.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.a.dao.AreaDao;
import mul.cam.a.dto.AreaDto;

@Repository
public class AreaDaoImpl implements AreaDao {

	@Autowired
	SqlSession session;
	
	String ns = "Area."; 
	
	@Override
	public List<AreaDto> arealist() {
		return session.selectList(ns + "arealist");
	}

	@Override
	public AreaDto getAreacode(int areacode) {
		
		return session.selectOne(ns + "getAreacode", areacode);
	}

}
