package mul.cam.a.service;

import mul.cam.a.dto.TripDto;

import java.util.List;

public interface TripService {
    List<TripDto> triplist(String city);

    List<TripDto> tripAllList();

    boolean writeTrip(TripDto dto);

    TripDto getTrip(int seq);

    boolean updateTrip(TripDto dto);

    boolean answerTrip(TripDto dto);

    boolean tripdelete(int seq);

    int tripReadcount(int seq);
}
