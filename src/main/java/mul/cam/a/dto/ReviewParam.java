package mul.cam.a.dto;

import java.io.Serializable;

public class ReviewParam implements Serializable{

	private String choice;	// 검색목록선택
	private String search;	// 검색어
	private int pageNumber; // 페이지번호
	
	private int start;		//페이지 시작번호
	private int end;		//페이지 끝번호
	
	
	//기본생성자
	public ReviewParam() {
		
	}

	
	//매개변수 있는 생성자
	public ReviewParam(String choice, String search, int pageNumber, int start, int end) {
		super();
		this.choice = choice;
		this.search = search;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}


	public String getChoice() {
		return choice;
	}


	public void setChoice(String choice) {
		this.choice = choice;
	}


	public String getSearch() {
		return search;
	}


	public void setSearch(String search) {
		this.search = search;
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public int getStart() {
		return start;
	}


	public void setStart(int start) {
		this.start = start;
	}


	public int getEnd() {
		return end;
	}


	public void setEnd(int end) {
		this.end = end;
	}


	@Override
	public String toString() {
		return "ReviewParam [choice=" + choice + ", search=" + search + ", pageNumber=" + pageNumber + ", start="
				+ start + ", end=" + end + "]";
	}
	
	
	
	
}
