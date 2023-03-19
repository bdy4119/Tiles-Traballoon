package mul.cam.a.dto;

import java.io.Serializable;

public class TripDto implements Serializable {

    private int seq;
    private String id;
    private String city;
    private String spot;
    private String title;
    private String image;
    private String content;
    private String wdate;
    private int readcount;

    public TripDto() {
    }

    public TripDto(int seq, String id, String city, String spot, String title, String image, String content, String wdate, int readcount) {
        this.seq = seq;
        this.id = id;
        this.city = city;
        this.spot = spot;
        this.title = title;
        this.image = image;
        this.content = content;
        this.wdate = wdate;
        this.readcount = readcount;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getSpot() {
        return spot;
    }

    public void setSpot(String spot) {
        this.spot = spot;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWdate() {
        return wdate;
    }

    public void setWdate(String wdate) {
        this.wdate = wdate;
    }

    public int getReadcount() {
        return readcount;
    }

    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }
}
