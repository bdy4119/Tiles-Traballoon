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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"--%>
    <%--          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">--%>

    <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
    <style type="text/css">
        .table th, .table td {
            text-align: center;
            vertical-align: middle !important;
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
                %>
            </td>

            <td><%=dto.getReadcount() %>
            </td>
            <td><%=dto.getId() %>
            </td>
        </tr>
        <%
                }
            }
        %>

        </tbody>
    </table>

    <br>

    <div class="container">
        <nav aria-label="Page navigation">
            <ul class="pagination" id="pagination" style="justify-content:center"></ul>
        </nav>
    </div>

    <br>
    <a href="communitywrite.do">글쓰기</a>

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
</div>
</body>
</html>



