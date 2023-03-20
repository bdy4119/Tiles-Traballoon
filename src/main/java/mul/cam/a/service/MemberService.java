package mul.cam.a.service;

import java.util.List;

import org.apache.ibatis.logging.Log;

import mul.cam.a.dto.MemberDto;

public interface MemberService {

	List<MemberDto> allMember();
	
	boolean idCheck(String id);
	
	// 현재까지 숫자로 가져오는중
	
	boolean addMember(MemberDto dto);
	MemberDto login(MemberDto dto);
	
	boolean deleteMember(String id);
	
	boolean updateMember(MemberDto dto);
	
	MemberDto info(String id);
	// 추 수 삭은 인트
	// addmem을 불린
}
