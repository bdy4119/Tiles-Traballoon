package mul.cam.a.dto;

import java.io.Serializable;

public class ReferenceDto implements Serializable{
	
	private int seq;
	private String id;
	
	private String reftext;
	private String refwdate;
	
	private int del;
	private int auth;
	
	public ReferenceDto() {
	}

	public ReferenceDto(int seq, String id, String reftext, String refwdate, int del, int auth) {
		super();
		this.seq = seq;
		this.id = id;
		this.reftext = reftext;
		this.refwdate = refwdate;
		this.del = del;
		this.auth = auth;
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

	public String getReftext() {
		return reftext;
	}

	public void setReftext(String reftext) {
		this.reftext = reftext;
	}

	public String getRefwdate() {
		return refwdate;
	}

	public void setRefwdate(String refwdate) {
		this.refwdate = refwdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "ReferenceDto [seq=" + seq + ", id=" + id + ", reftext=" + reftext + ", refwdate=" + refwdate + ", del="
				+ del + ", auth=" + auth + "]";
	}
	
	
	
}
