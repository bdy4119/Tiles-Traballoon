package mul.cam.a.dto;

import java.sql.Timestamp;

public class HotelCommentDto {

	  private int seq;
	  private String id;
	  private int hotelSeq;
	  private String content;
	  private Timestamp wdate;

	public HotelCommentDto() {
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

	public int getHotelSeq() {
		return hotelSeq;
	}

	public void setHotelSeq(int hotelSeq) {
		this.hotelSeq = hotelSeq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getWdate() {
		return wdate;
	}

	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}
}