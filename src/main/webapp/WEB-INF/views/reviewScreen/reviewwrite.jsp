<%@page import="mul.cam.a.dto.MemberDto"%>
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
    <hr>
    <h1>글쓰기</h1>
    <hr>
		<div align="center" class="form-group">
		<form action="writeReviewAf.do" id="frm" method="post">
			<table class="table table-striped">
				<col width="200">
				<col width="400">
				<tr>
					<th>id</th>
					<td>
						<%--  나중에 로그인세션 넣기
							<%=login.getId() %>
						--%>
						<input type="text" id="id" name="id" class="form-control"/>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="title" name="title" name="" size="50px" class="form-control"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="20" cols="50px" id="content" name="content" placeholder="내용을 작성해주세요" class="form-control col-sm-5"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<button type="submit" id="reviewwrite" class="btn btn-secondary">글쓰기</button>
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

	$(document).ready(function() {
	
		$("#reviewwrite").click(function() {
			$.ajax({
				type:"POST",
				url:"writeReviewAf.do",
				data: {
 					"id" : $("id").val(),
					"title" : $("title").val(),
					"content" : $("content").val()},
				success: function(str) {
					if(str == "REVIEW_ADD_OK") {
						alert("글이 등록되었습니다.");
						location.href="review.do";
					}
				}, error: function() {
					alert("글을 등록하지 못했습니다.");
					location.href="review.do";
				}
			})
		})
		
	});
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
        