package mul.cam.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.ReferenceDao;
import mul.cam.a.dto.ReferenceDto;
import mul.cam.a.service.ReferenceService;

@Service
public class ReferenceServiceImpl implements ReferenceService{
	
	@Autowired
	ReferenceDao dao;
	
	@Override
	public boolean addReference(ReferenceDto dto) {
		int count = dao.addReference(dto);
		return count>0?true:false;
	}
	
}
