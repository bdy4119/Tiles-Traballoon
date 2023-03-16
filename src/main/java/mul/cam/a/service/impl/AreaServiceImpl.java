package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.AreaDao;
import mul.cam.a.dto.AreaDto;
import mul.cam.a.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	AreaDao dao;

	@Override
	public List<AreaDto> arealist() {
		return dao.arealist();
	}

	@Override
	public AreaDto getAreacode(int areacode) {
		
		return dao.getAreacode(areacode);
	}
}
