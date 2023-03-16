package mul.cam.a.dto;

public class HotelPagingDto {
	private int pageNo; // 페이지번호
	private int viewCount; // 보여줄갯수
	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	
	
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

}
