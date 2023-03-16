package mul.cam.a.service;

import java.util.List;

import mul.cam.a.dto.AreaDto;

public interface AreaService {
	List<AreaDto> arealist();	// 코드, 이름, 이미지
	
	AreaDto getAreacode(int areacode);	
}
