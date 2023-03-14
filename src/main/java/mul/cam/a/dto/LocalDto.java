package mul.cam.a.dto;

import java.io.Serializable;

public class LocalDto implements Serializable {
	private int seq;		// sequence 글번호
	private String regionname;		// 지역이름(서울, 경기)
	
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

	@Override
	public String toString() {
		return "LocalDto [seq=" + seq + ", regionname=" + regionname + "]";
	}
	
	
}
