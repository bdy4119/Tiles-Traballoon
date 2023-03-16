package mul.cam.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.LocalDao;
import mul.cam.a.dto.LocalDto;
import mul.cam.a.service.LocalService;

@Service
public class LocalServiceImpl implements LocalService{

	@Autowired
	LocalDao dao;
	
	@Override
	public LocalDto getLocal(int seq) {
		
		return dao.getLocal(seq);
	}

}
