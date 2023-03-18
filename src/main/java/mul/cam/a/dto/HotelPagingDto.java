package mul.cam.a.dto;

public class HotelPagingDto {
	private int pageNo; // 페이지번호
	private int viewCount; // 보여줄갯수
	private String orderBy; // 정렬
	private int limit; // 시작 limit index
	
	public HotelPagingDto() {
	}
	
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
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}

}
