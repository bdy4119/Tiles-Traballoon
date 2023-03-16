package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.MypageDao;
import mul.cam.a.dto.MypageDto;
import mul.cam.a.service.MypageService;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	MypageDao dao;
	
	public List<MypageDto> allMember() {
		return dao.allMember();
	}
}
