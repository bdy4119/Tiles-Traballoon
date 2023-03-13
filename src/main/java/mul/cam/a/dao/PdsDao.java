package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.PdsDto;
import mul.cam.a.dto.PdsParam;

public interface PdsDao {

	List<PdsDto> pdslist(PdsParam param);
	
	int uploadPds(PdsDto dto);
	
	void downcount(int seq);
	
	PdsDto getPds(int seq);
	
	int updatePds(PdsDto pds);
}
