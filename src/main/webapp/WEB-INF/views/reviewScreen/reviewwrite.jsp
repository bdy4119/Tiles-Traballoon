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
    <%--내용--%>
    <h1>글쓰기</h1>
		<div align="center">
		<form action="reviewwriteAf.do" id="frm" method="post">
			<table border="1">
				<col width="200">
				<col width="400">
				<tr>
					<th>id</th>
					<td>
						<input type="text" id="id" name="id"/>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="title" name="title" name="" size="50px">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="20" cols="50px" id="content" name="content" placeholder="내용을 작성해주세요"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<button type="submit" id="reviewwrite">글쓰기</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
		
		
		<script type="text/javascript">
			
		</script>
    </main>
    <%--내용--%>
    

</div>
<script type="text/javascript">

</script>
<%--container--%>

<%--BootStrap--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">
</script>
<%--BootStrap--%>

</body>
</html>
        