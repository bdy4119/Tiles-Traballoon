package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.AreaDto;


public interface AreaDao {

	List<AreaDto> arealist();	// 1페이지 사진뿌리기
	
	AreaDto getAreacode(int areacode);
}
