package mul.cam.a.service.impl;

import mul.cam.a.dao.TripDao;
import mul.cam.a.dto.TripDto;
import mul.cam.a.dto.TripDto;
import mul.cam.a.service.TripService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TripServiceImpl implements TripService {
    @Autowired
    TripDao dao;

    @Override
    public List<TripDto> triplist(String city) {
        return dao.triplist(city);
    }

    @Override
    public boolean writeTrip(TripDto dto) {
        int n = dao.writeTrip(dto);
        return n>0?true:false;
    }

    @Override
    public TripDto getTrip(int seq) {
        return dao.getTrip(seq);
    }

    @Override
    public boolean updateTrip(TripDto dto) {
        int n = dao.updateTrip(dto);
        return n>0?true:false;
    }

    @Override
    public boolean answerTrip(TripDto dto) {
        dao.answerTripUpdate(dto);
        int n = dao.answerTripInsert(dto);
        return n>0?true:false;
    }

}
