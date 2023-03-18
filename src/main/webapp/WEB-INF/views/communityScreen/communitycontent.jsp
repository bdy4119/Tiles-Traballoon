<%@page import="mul.cam.a.util.Utility" %>
<%@page import="mul.cam.a.dto.CommunityDto" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--Pagination--%>
    <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>

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
        a {
            color: #666; /* 적용할 색상 */
            text-decoration: none; /* 밑줄 제거 */
        }
        td, th {
            color: #666;
        }
        table {
            font-size: 14px;
        }
        .pagination a, .pagination span {
            color: #666; /* 글씨 색상 */
            background-color: #fff; /* 버튼 색상 */
            /* 버튼 테두리 색상 */
        }
        .pagination a:hover, .pagination span:hover {
            color: #666; /* 호버 시 글씨 색상 */
            background-color: #eceef0; /* 호버 시 버튼 색상 */
            /* 호버 시 버튼 테두리 색상 */
        }
        .pagination .page-item.active .page-link {
            color: #666;
            background-color: #eceef0;
            border-color: #dee2e6;
        }
        .pagination-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin: 0px 50px;
        }
        .write-button-container {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
        .button-wrapper .btn {
            width: 70px;
        }
    </style>

</head>
<body>

<%
    List<CommunityDto> list = (List<CommunityDto>) request.getAttribute("communitylist");
    int pageCommunity = (Integer) request.getAttribute("pageCommunity");
    int pageNumber = (Integer) request.getAttribute("pageNumber");
    String choice = (String) request.getAttribute("choice");
    String search = (String) request.getAttribute("search");
%>

<div class="container">
<div align="center">
    <img src="images/community.png" class="img-fluid">
    
    <table style="margin-left: auto; margin-right: auto; margin-top: 30px; margin-bottom: 3px">
        <tr>
        	<td>
			    <!-- 원하는 순서로 보기 -->
				<button type="button" value="wdate" onclick="location.href='comWdateOrder.do'" class="btn btn-info">최신순</button>
				<button type="button" value="longdate" onclick="location.href='comLongdateOrder.do'" class="btn btn-info">오래된순</button>
				<button type="button" value="readcount" onclick="location.href='comReadcountOrder.do'" class="btn btn-info">조회수순</button>
				<!-- 원하는 순서로 보기 END-->
        	</td>
            <td style="padding-left: 3px">
                <select class="custom-select" id="choice" name="choice">
                    <option selected>검색</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
            </td>
            <td style="padding-left: 5px" class="align-middle">
                <input type="text" class="form-control" id="search" name="search" onkeyup="enterKeyEvent()"
                       placeholder="검색어" value="<%=search %>">
            <td style="padding-left: 5px">
			<span>
				<button type="button" class="btn btn-primary" onclick="searchBtn()">검색</button>
			</span>
            </td>
        </tr>
    </table>

    <br>

    <table class="table table-hover table-sm" style="width: 1000px">
        <col width="70">
        <col width="600">
        <col width="100">
        <col width="150">
        <thead>
        <tr class="bg-primary" style="color: white;">
            <th>번호</th>
            <th>제목</th>
            <th>조회수</th>
            <th>작성자</th>
        </tr>
        </thead>
        <tbody>

        <%
            if (list == null || list.size() == 0) {
        %>
        <tr>
            <td colspan="4">작성된 글이 없습니다</td>
        </tr>
        <%
        } else {

            for (int i = 0; i < list.size(); i++) {
                CommunityDto dto = list.get(i);
        %>
        <tr>
            <th><%=i + 1 + (pageNumber * 10) %>
            </th>

            <td style="text-align: left;">
                <%
                    if (dto.getDel() == 0) {
                %>
                <%=Utility.arrow(dto.getDepth()) %>
                <a href="communitydetail.do?seq=<%=dto.getSeq() %>">
                    <%=dto.getTitle() %>
                </a>
                <%
                } else if (dto.getDel() == 1) {
                %>
                <%=Utility.arrow(dto.getDepth()) %>
                <font color="#ff0000">*** 이 글은 작성자에 의해서 삭제되었습니다 ***</font>
                <%

                    }
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="pagination-container">
        <div class="container">
            <nav aria-label="Page navigation">
                <ul class="pagination" id="pagination"></ul>
            </nav>
        </div>
        <div class="write-button-container">
            <div class="button-wrapper">
                <a href="communitywrite.do" class="btn btn-secondary">글쓰기</a>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        let search = "<%=search %>";
        console.log("search = " + search);
        if (search != "") {
            let obj = document.getElementById("choice");
            obj.value = "<%=choice %>";
            obj.setAttribute("selected", "selected");
        }

        function enterKeyEvent() {
            if (window.event.keyCode == 13) {
                searchBtn();
            }
        }

        function searchBtn() {
            let choice = document.getElementById('choice').value;
            let search = document.getElementById('search').value;

            location.href = "community.do?choice=" + choice + "&search=" + search;
        }

        $('#pagination').twbsPagination({
            startPage: <%=pageNumber+1 %>,
            totalPages: <%=pageCommunity %>,
            visiblePages: 10,
            first: '<span srid-hidden="true">«</span>',
            prev: "이전",
            next: "다음",
            last: '<span srid-hidden="true">»</span>',
            initiateStartPageClick: false,   // onPageClick 자동실행되지 않도록
            onPageClick: function (event, page) {
                // alert(page);
                let choice = document.getElementById('choice').value;
                let search = document.getElementById('search').value;
                location.href = "community.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page - 1);
            }
        });
    </script>
</div>

</body>

</html>



