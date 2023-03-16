package mul.cam.a.dto;

import java.io.Serializable;

public class AreaDto implements Serializable{
	
	private int areacode;			// 지역코드
	private String areaname;		// 지역이름
	private String image;			// 대표사진 이름
	
	public AreaDto() {
	}

	public AreaDto(int areacode, String areaname, String image) {
		super();
		this.areacode = areacode;
		this.areaname = areaname;
		this.image = image;
	}

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "AreaDto [areacode=" + areacode + ", areaname=" + areaname + ", image=" + image + "]";
	}
	
	
	
	
}
