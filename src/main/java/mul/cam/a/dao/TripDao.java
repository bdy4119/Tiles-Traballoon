package mul.cam.a.dao;


import mul.cam.a.dto.TripDto;


import java.util.List;

public interface TripDao {
    
    List<TripDto> triplist(String city);
    List<TripDto> tripAllList();

    int writeTrip(TripDto dto);

    TripDto getTrip(int seq);

    int updateTrip(TripDto dto);

    int answerTripUpdate(TripDto dto);
    int answerTripInsert(TripDto dto);
    
}
