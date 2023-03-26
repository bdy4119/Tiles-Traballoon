<%@page import="mul.cam.a.util.Utility" %>
<%@page import="mul.cam.a.dto.TripDto" %>
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
    List<TripDto> list = (List<TripDto>) request.getAttribute("tripadminlist");
%>

<div class="container">

    <div class="table-responsive">
        <table class="table" style="border-collapse: collapse;">
            <thead style="background-color: #f8f9fa;">
            <tr>
                <th scope="col" style="width: 8%; text-align: center;">번호</th>
                <th scope="col" style="width: 8%; text-align: center;">고유번호</th>
                <th scope="col" style="width: 15%; text-align: center;">도시</th>
                <th scope="col" style="width: 40%; text-align: center;">관광지</th>
                <th scope="col" style="width: 15%; text-align: center;">작성일</th>
                <th scope="col" style="width: 14%; text-align: center;">작성자명</th>
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
                    TripDto dto = list.get(i);
            %>
            <tr>
                <th style="text-align: center;"><%=i + 1%>
                </th>

                <td style="text-align: center;"><%=dto.getSeq() %>
                </td>

                <td style="text-align: center;"><%=dto.getCity() %>
                </td>

                <td>
                    <a href="tripupdate.do?seq=<%=dto.getSeq() %>">
                        <%=dto.getSpot() %>
                    </a>
                </td>

                <td style="text-align: center;"><%=dto.getWdate() %>
                </td>

                <%--아이디 추가 예정--%>
                <td style="text-align: center;">admin
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
            <div class="button-wrapper">
                <a href="tripwrite.do" class="btn btn-secondary">글쓰기</a>
            </div>
        </div>
    </div>


</div>

</body>

</html>



