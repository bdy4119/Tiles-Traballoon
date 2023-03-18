package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.MemberDto;
import mul.cam.a.dto.MypageDto;

public interface MypageDao {

	List<MypageDto> allMember();
	
	MypageDto info(MypageDto dto);
	
	
}
