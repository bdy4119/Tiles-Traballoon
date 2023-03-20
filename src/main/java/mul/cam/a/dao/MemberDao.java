package mul.cam.a.dao;

import java.util.List;

import mul.cam.a.dto.MemberDto;

public interface MemberDao {

	List<MemberDto> allMember();
	
	int idCheck(String id);
	
	int addMember(MemberDto dto);
	
	MemberDto login(MemberDto dto);
	
	int deleteMember(String id);
	
	int updateMember(MemberDto dto);
	
	MemberDto info(String id);
	// 추가 삭제 수정은 반환값이 숫자다
	// selectone 은 하나반환 selectlist 는 여러개  ->> 해당 하는 자료형 
}

