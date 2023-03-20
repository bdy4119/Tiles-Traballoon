package mul.cam.a.dto;

import java.sql.Timestamp;

public class HotelDto {
	 private int seq;
	 private int readCount;
	 private String hotel_name;
	 private String thumbnail;
	 private Timestamp wdate;
	 private String content;
	 private String map;
	 private String book;
	 private String brief;
	 
	 public HotelDto() {
}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getHotel_name() {
		return hotel_name;
	}

	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Timestamp getWdate() {
		return wdate;
	}
 
	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public String getBook() {
		return book;
	}

	public void setBook(String book) {
		this.book = book;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}
	 

	
}

	