<%@page import="mul.cam.a.dao.ReviewDao"%>
<%@page import="mul.cam.a.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SemiProject</title>

    <%--BootStrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    

    <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            
        }
    </style>

</head>

<body>

<%
	ReviewDto dto = (ReviewDto)request.getAttribute("dto");
%>
<%--container--%>
<div class="container">
    <main>

        <%--헤더--%>
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                <img src="images/logo.png">
            </a>

            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="/localtravel.do" class="nav-link px-2 link-dark">지역별 여행</a></li>
                <li><a href="/hotel.do" class="nav-link px-2 link-dark">숙소 추천</a></li>
                <li><a href="/review.do" class="nav-link px-2 link-dark">여행 리뷰</a></li>
                <li><a href="/community.do" class="nav-link px-2 link-dark">커뮤니티</a></li>
            </ul>


            <div class="col-md-3 text-end">
                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="/mypage.do" class="nav-link px-2 link-dark">마이페이지</a></li>
                    <li>
						<a class="btn btn-outline-primary me-2" href="/loginpage.do" role="button">Login</a>
                    </li>
                    <li>
                        <button type="button" class="btn btn-primary">Sign-up</button>
                    </li>
                </ul>
            </div>
        </header>
        <%--헤더--%>
         
         
    <%--내용--%>
  	<h2>수정</h2>
		<div align="center">
			<form action="reviewUpdateAf.do" method="post">
				<input type="hidden" name="seq" value="<%=dto.getSeq() %>"> <!-- seq보내기 -->
				
				<table border="1">
				<col width="200"><col width="500">
					<tr>
						<th>아이디</th>
						<td><%=dto.getId() %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="title" size="50" value='<%=dto.getTitle()%>'>
						</td>	
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="50" name="content"><%=dto.getContent()%></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="수정완료">
						</td>
					</tr>
				</table>
			</form>
		</div>
    </main>
    <%--내용--%>
    
    
    
    <%--푸터--%>
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <div class="col-md-4 d-flex align-items-center">
            <span class="mb-3 mb-md-0 text-muted">&copy; 2023 Multi campus, Semi project</span>
        </div>
    </footer>
    <%--푸터--%>

</div>
<%--container--%>

<%--BootStrap--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">
</script>
<%--BootStrap--%>

</body>
</html>
        