package mul.cam.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.a.dao.MemberDao;
import mul.cam.a.dto.MemberDto;
import mul.cam.a.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	// Dao 접근(생성)
	@Autowired
	MemberDao dao;
	
	@Override
	public List<MemberDto> allMember() {		
		return dao.allMember();		
	}

	@Override
	public boolean idCheck(String id) {
		int count = dao.idCheck(id);
		return count>0?true:false;
	}

	@Override
	public boolean addMember(MemberDto dto) {
		// addmember가 int 값의 반환이기때문에 int count로 받는다  
		// 영향을 받은 데이터의 갯수가 몇개이냐 = 1
		int count = dao.addMember(dto); // db에 추가가 되었을때 addmember를 통해 영향을 받은 데이터의 갯수 == count .. 추가된 데이터의 갯수 
		// 데이터의 영향이 있는 지 검사
		// 추가가 되었기때문에 true가 될것
		return count>0?true:false;
	}
	// dao 에서 int 로 몇개가 되었는가 를 기준으로 하나도 안되면 0 이고 하나가되면 1 두개가되면 2
	// true 
	@Override
	public MemberDto login(MemberDto dto) {		
		return dao.login(dto);
	}
	
	@Override
	public boolean deleteMember(String id) {	
		int count = dao.deleteMember(id);		// 실행함으로서 삭제된데이터의 갯수
		return count>0?true:false;
		// boolean 
	}
	
	@Override
	public boolean updateMember(MemberDto dto) {
		int count = dao.updateMember(dto);
		return count>0?true:false;
	}
	
}





