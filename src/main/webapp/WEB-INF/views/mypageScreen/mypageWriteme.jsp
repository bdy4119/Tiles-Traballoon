<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.CommunityDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.dto.MypageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
List<CommunityDto> list = (List<CommunityDto>) request.getAttribute("communitylist");
int pageCommunity = (Integer) request.getAttribute("pageCommunity");
int pageNumber = (Integer) request.getAttribute("pageNumber");
String choice = (String) request.getAttribute("choice");
String search = (String) request.getAttribute("search");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<style>
.board-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            margin-top: 40px; /* 상단 간격 조정 */
}
.board-sort {
            display: flex;
            align-items: center;
            padding-bottom: 15px;
}
.search-container {
            display: flex;
            align-items: center;
}
.custom-select {
            width: 100px;
            margin-right: 10px;
}
.form-control {
            flex: 1;
            margin-right: 10px;
        }
.btn-secondary {
            width: 70px;
        }
</style>
</head>
<body>
<div class="container">
		<ul class="nav nav-pills nav-justified">
			<li class="nav-item"><a class="nav-link font-nt"
				href="mypageCommunityAf.do">커뮤니티</a></li>
			<li class="nav-item"><a class="nav-link font-nt"
				href="mypageReviewAf.do">여행 리뷰</a></li>
		</ul>
	</div>
	<div class="container">
		<div class="board-header">
			<div class="board-sort">
            <select class="custom-select" id="sort" name="sort">
                <option selected>최신순</option>
                <option value="oldsort">오래된순</option>
                <option value="reviewsort">조회순</option>
                <option value="commentsort">댓글순</option>
            </select>
        </div>
			<div class="search-container">
				<select class="custom-select" id="choice" name="choice">
					<option selected>검색</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select> 
				<input type="text" class="form-control" id="search" name="search"
					onkeyup="enterKeyEvent()" placeholder="검색어" value="">
				<button type="button" class="btn btn-secondary"
					onclick="searchBtn()">검색</button>
			</div>
		</div>

		<div class="table-responsive">
			<table class="table" style="border-collapse: collapse;">
				<thead style="background-color: #f8f9fa;">
					<tr>
						<th scope="col" style="width: 8%; text-align: center;">번호</th>
						<th scope="col" style="width: 60%">제목</th>
						<th scope="col" style="width: 16%; text-align: center;">조회수</th>
						<th scope="col" style="width: 16%; text-align: center;">작성자명</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>

</div>
		<div class="pagination-container">
			<div class="container">
				<nav aria-label="Page navigation">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
			</div>
</body>
</html>