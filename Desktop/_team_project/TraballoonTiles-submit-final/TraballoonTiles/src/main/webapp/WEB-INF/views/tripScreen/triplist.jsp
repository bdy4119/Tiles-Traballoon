<%@page import="mul.cam.a.dto.TripDto" %>
<%@page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession loginsession = request.getSession();
    String userId = (String) loginsession.getAttribute("id");
    TripDto dto;
%>
<html>
<head>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">

    <style>

        .col-md-12 {
            padding-top: 20px;
            padding-bottom: 20px;
        }

        a {
            color: #333; /* 원하는 색상으로 변경 */
            text-decoration: none; /* 텍스트 밑줄 제거 */
        }

        a:hover {
            text-decoration: none; /* 마우스 오버시 텍스트 밑줄 제거 */
            color: #333;
        }

        .material-design-label {
            display: inline-block;
            padding: 8px 16px;
            color: #fff;
            background-color: #2196F3;
            border-radius: 24px;
            font-weight: 500;
            font-size: 1.2rem;
            line-height: 1.5;
            letter-spacing: 0.01em;
            text-transform: uppercase;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25);
        }

        h1 {
            font-size: 3em;
            text-align: center;
            font-family: 'Noto Serif KR', serif;
            color: #333;
        }

        .card-body {
            overflow: hidden;
            height: auto;
        }

        .card-body img {
            max-width: 100%;
        }

    </style>
</head>
<body>
<%
    String korName = "";
    String engName = "";
    String city = (String) request.getAttribute("City");

    if (city.equals("seoul")) {
        korName = "서울";
        engName = "Seoul";
    } else if (city.equals("gyeonggi")) {
        korName = "경기";
        engName = "Gyeonggi";
    } else if (city.equals("gangwon")) {
        korName = "강원";
        engName = "Gangwon";
    } else if (city.equals("chungcheong")) {
        korName = "충청";
        engName = "Chungcheong";
    } else if (city.equals("jeolla")) {
        korName = "전라";
        engName = "Jeolla";
    } else if (city.equals("gyeongsang")) {
        korName = "경상";
        engName = "Gyeongsang";
    } else if (city.equals("jeju")) {
        korName = "제주";
        engName = "Jeju";
    } else if (city.equals("incheon")) {
        korName = "인천";
        engName = "Incheon";
    }

    String abc = "abc";
%>

<main>

    <div class="container">

        <br>
        <h1>Welcome to "<%= engName %>"</h1>

        <%
            List<TripDto> list = (List<TripDto>) request.getAttribute("triplist");
        %>
        <%
            if (list == null || list.size() == 0) {
        %>
        <tr>
            <td colspan="4">작성된 글이 없습니다</td>
        </tr>
        <%
            }
        %>

        <div class="col">
            <%
                for (int i = 0; i < list.size(); i++) {
                    dto = list.get(i);
            %>
            <hr>
            <a href="tripdetail.do?seq=<%=dto.getSeq() %>">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-4">
                            <div class="card-body">
                                <%=dto.getImage() %>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="card-body">
                                <h3 class="card-title"><%=dto.getSpot()%>
                                </h3>
                                <p class="card-text"><%=dto.getTitle()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </a>
            <%
                }
            %>
        </div>
    </div>
</main>
<br>
<div id="user">
    <%
        if (loginsession.getAttribute("id").equals("admin")) {
    %>
    <div class="d-flex justify-content-center mt-4">
        <a class="btn btn-sm btn-outline-secondary" href="tripadmin.do">Admin</a>
    </div>
    <%
        }
    %>
</div>
</body>
</html>