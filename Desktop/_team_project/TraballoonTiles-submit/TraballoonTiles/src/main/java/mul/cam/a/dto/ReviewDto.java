package mul.cam.a.dto;

import java.io.Serializable;

public class ReviewDto implements Serializable{
	
	private int seq;		// sequence 글번호
	private String id;		// 작성자
	
	private int ref;		// 답글용	 	그룹번호(글번호)	
	private int step;		//			행번호
	private int depth;		//			깊이
	
	private String title;
	private String content;
	private String wdate;
	
	private int del;
	private int readcount;	// 조회수
	
	private String updatedate;	//수정날짜
	private String deletedate;	//삭제날짜
	
	
	//매개변수 없는 생성자
	public ReviewDto() {
	}


	//외부에서 매개변수 받는 생성자
	public ReviewDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}


	//전체 매개변수 생성자
	public ReviewDto(int seq, String id, int ref, int step, int depth, String title, String content, String wdate,
			int del, int readcount, String updatedate, String deletedate) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
		this.updatedate = updatedate;
		this.deletedate = deletedate;
	}


	
	// getter setter
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


	public int getRef() {
		return ref;
	}


	public void setRef(int ref) {
		this.ref = ref;
	}


	public int getStep() {
		return step;
	}


	public void setStep(int step) {
		this.step = step;
	}


	public int getDepth() {
		return depth;
	}


	public void setDepth(int depth) {
		this.depth = depth;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
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


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	public String getUpdatedate() {
		return updatedate;
	}


	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}


	public String getDeletedate() {
		return deletedate;
	}


	public void setDeletedate(String deletedate) {
		this.deletedate = deletedate;
	}


	@Override
	public String toString() {
		return "ReviewDto [seq=" + seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth
				+ ", title=" + title + ", content=" + content + ", wdate=" + wdate + ", del=" + del + ", readcount="
				+ readcount + ", updatedate=" + updatedate + ", deletedate=" + deletedate + "]";
	}
	
	
	
	
	
	
	
}
