package mul.cam.a.dto;

import java.io.Serializable;

public class LocalDto implements Serializable {
	private int seq;		// sequence 지역번호
	private String regionname;		// 지역이름(서울, 경기)
	private int readcount;
	
	public LocalDto() {
		
	}

	public LocalDto(int seq, String regionname) {
		super();
		this.seq = seq;
		this.regionname = regionname;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getRegionname() {
		return regionname;
	}

	public void setRegionname(String regionname) {
		this.regionname = regionname;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	@Override
	public String toString() {
		return "LocalDto [seq=" + seq + ", regionname=" + regionname + ", readcount=" + readcount + "]";
	}
	
	
	
}
