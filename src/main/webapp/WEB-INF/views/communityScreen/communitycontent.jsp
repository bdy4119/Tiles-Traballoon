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

    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">

</head>
<body>

<%
    List<CommunityDto> list = (List<CommunityDto>) request.getAttribute("communitylist");
    int pageCommunity = (Integer) request.getAttribute("pageCommunity");
    int pageNumber = (Integer) request.getAttribute("pageNumber");
    String choice = (String) request.getAttribute("choice");
    String search = (String) request.getAttribute("search");

    String sortType = (String) request.getAttribute("sortType");
%>

<div class="container">
    <img src="pageimage/image01.jpg" class="img-fluid" alt="Responsive image">
    <div class="board-header">
        <div class="board-sort" style="margin-bottom: -13px;">
            <!-- 원하는 순서로 보기 -->
            <select class="custom-select" id="sort" name="sort" onchange="sortTable()">
                <option value="wdate" <% if (sortType.equals("wdate")) { %>selected<% } %>>최신순</option>
                <option value="longdate" <% if (sortType.equals("longdate")) { %>selected<% } %>>옛날순</option>
                <option value="readcount" <% if (sortType.equals("readcount")) { %>selected<% } %>>조회수순</option>
            </select>
            <!-- 원하는 순서로 보기 END-->
        </div>
        <div class="search-container">
            <select class="custom-select" id="choice" name="choice">
                <%--                <option selected>제목</option>--%>
                <option selected value="title">제목</option>
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
                <th scope="col" style="width: 50%">제목</th>
                <th scope="col" style="width: 16%; text-align: center;">조회수</th>
                <th scope="col" style="width: 16%; text-align: center;">작성일</th>
                <th scope="col" style="width: 16%; text-align: center;">작성자</th>
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
                <th style="text-align: center;"><%=i + 1 + (pageNumber * 10) %>
                </th>

                <td>
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

                <td style="text-align: center;"><%=dto.getReadcount() %>
                </td>
                <td style="text-align: center;"><%=dto.getWdate() %>
                </td>
                <td style="text-align: center;"><%=dto.getId() %>
                </td>

            </tr>
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
            <div class="button-wrapper" style="margin-right: -50px;">
                <a href="communitywrite.do" class="btn btn-secondary"
                   style="margin-right: 5px; padding-left: 10px; padding-right: 10px;">글쓰기</a>
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

    <script>
        function sortTable() {
            var value = document.getElementById("sort").value;
            if (value === "wdate") {
                window.location.href = 'comWdateOrder.do';
            } else if (value === "longdate") {
                window.location.href = 'comLongdateOrder.do';
            } else if (value === "readcount") {
                window.location.href = 'comReadcountOrder.do';
            }
        }
    </script>
</div>

</body>

</html>


