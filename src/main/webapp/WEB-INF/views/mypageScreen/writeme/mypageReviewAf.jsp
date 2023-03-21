<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dao.ReviewDao"%>
<%@page import="mul.cam.a.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
MemberDto login = (MemberDto) session.getAttribute("login");
List<ReviewDto> mrList = (List<ReviewDto>) request.getAttribute("mrList");
int pageBbs = (Integer) request.getAttribute("pageBbs");
/* System.out.println(request.getAttribute("pageBbs") + " " + request.getAttribute("pageNumber"));
int pageBbs = 0;
if ( request.getAttribute("pageBbs") != null){
	pageBbs = (Integer) request.getAttribute("pageBbs");
} */
int pageNumber = (Integer) request.getAttribute("pageNumber");
String choice = (String) request.getAttribute("choice");
String search = (String) request.getAttribute("search");
%>
<!Doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
<title>SemiProject</title>
<style>
.container1 a{
	font-weight : bold;
	color : gray;
	font-family: Arial, sans-serif;
}
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
        <li class="nav-item">
            <a class="nav-link font-nt " href="mypageReviewAf.do?choice=검색&search=<%=login.getId()%>">여행 리뷰</a>
        </li>
        <li class="nav-item">
            <a class="nav-link font-nt " href="mypageCommunityAf.do?choice=검색&search=<%=login.getId()%>">커뮤니티</a>
        </li>
    </ul>
</div>

		<div class="list-group">
		  
		 </div>
<div class="container">
	<div class="board-header">
		<div class="board-sort"></div>
        <div class="search-container">
            <select class="custom-select" id="choice" name="choice">
                <option selected>검색</option>
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="writer">작성자</option>
            </select>
            <input type="text" class="form-control" id="search" name="search" onkeyup="enterKeyEvent()"
                   placeholder="검색어"
                   value="<%=search %>">
            <button type="button" class="btn btn-secondary" onclick="searchBtn()">검색</button>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table" style="border-collapse: collapse;">
            <thead style="background-color: #f8f9fa;">
            <tr>
                <th scope="col" style="width: 8%; text-align: center;">번호</th>
                <th scope="col" style="width: 60%">제목</th>
                <th scope="col" style="width: 16%; text-align: center;">조회수</th>
                <th scope="col" style="width: 24%; text-align: center;">작성일자</th>
            </tr>
            </thead>
            <tbody>

				<%
				if (mrList == null || mrList.size() == 0) {
				%>
				<tr>
					<td colspan="4">작성된 글이 없습니다</td>
				</tr>
				<%
				} else {

				for (int i = 0; i < mrList.size(); i++) {
					ReviewDto dto = mrList.get(i);
				%>
				<tr>
					<th style="text-align: center;"><%=i + 1 + (pageNumber * 10)%>
					</th>

					<td>
						<%
						if (dto.getDel() == 0) {
						%> <%=Utility.arrow(dto.getDepth())%> <a
						href="reviewdetail.do?seq=<%=dto.getSeq()%>"> <%=dto.getTitle()%>
					</a> <%
				 } else if (dto.getDel() == 1) {
				 %> 
				 <%=Utility.arrow(dto.getDepth())
				 %> 
				 <font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다 ***</font> 
				 <%
				 }
				 %>
					</td>

					<td style="text-align: center;"><%=dto.getReadcount()%></td>
					<td style="text-align: center;"><%=dto.getWdate()%></td>

				</tr>
				<%
				}
				}
				%>
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
<script type="text/javascript">

    let search = "<%=search%>";
    console.log("search = " + search);
    	if (search != "") {
            let obj = document.getElementById("choice");
            obj.value = "<%=choice %>";
		obj.setAttribute("selected", "selected");
	}
        
    function searchBtn() {
    	let choice = document.getElementById('choice').value;
    	let search = document.getElementById('search').value;

    	location.href = "review.do?choice=" + choice + "&search=" + search;
    }
        
	function enterKeyEvent() {
		if (window.event.keyCode == 13) {
			searchBtn();
		}
	}

	$('#pagination').twbsPagination({
		startPage :	<%=pageNumber + 1%>,
		totalPages : <%=pageBbs%>,
		visiblePages : 10,
		first : '<span srid-hidden="true">«</span>',
		prev : "이전",
		next : "다음",
		last : '<span srid-hidden="true">»</span>',
		initiateStartPageClick : false, // onPageClick 자동실행되지 않도록
		onPageClick : function(event, page) {
							// alert(page);
			let choice = document.getElementById('choice').value;
			let search = document.getElementById('search').value;
			location.href = "community.do?choice=" + choice	+ "&search=" + search + "&pageNumber="	+ (page - 1);
			}
		});
</script>

</body>
</html>

