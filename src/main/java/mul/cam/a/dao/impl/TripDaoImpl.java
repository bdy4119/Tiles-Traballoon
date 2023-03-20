package mul.cam.a.dao.impl;

import mul.cam.a.dao.TripDao;
import mul.cam.a.dto.TripDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TripDaoImpl implements TripDao {

	@Autowired
	SqlSession session;
	
	String ns = "Trip.";

	@Override
	public List<TripDto> triplist(String city) {
		return session.selectList(ns + "triplist", city);
	}

	@Override
	public List<TripDto> tripAllList() {
		return session.selectList(ns + "tripAllList");
	}

	@Override
	public int writeTrip(TripDto dto) {		
		return session.insert(ns + "writeTrip", dto);
	}

	@Override
	public TripDto getTrip(int seq) {		
		return session.selectOne(ns + "getTrip", seq);
	}

	@Override
	public int updateTrip(TripDto dto) {	
		return session.update(ns + "updateTrip", dto);
	}

	@Override
	public int answerTripUpdate(TripDto dto) {		
		return session.update(ns + "answerTripUpdate", dto);
	}

	@Override
	public int answerTripInsert(TripDto dto) {		
		return session.insert(ns + "answerTripInsert", dto);
	}

	@Override
	public int tripdelete(int seq) {
		return session.update(ns + "tripdelete", seq);
	}

	@Override
	public int tripReadcount(int seq) {
		return session.update(ns + "tripReadcount", seq);
	}


}





