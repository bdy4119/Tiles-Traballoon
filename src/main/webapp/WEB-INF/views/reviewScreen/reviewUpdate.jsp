<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
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
        
        th{
			background-color: #007bff;
			color: white;
		}
		
		pre{
			white-space: pre-wrap;
			word-break: break-all;
			overflow: auto;
		}
        
        /*  .main-crop {
		    position: relative;
		    width: 100%; // 자를 사이즈를 명시해준다.
		    height: 20px;
		    overflow: hidden;
		
		    .main-img {
		      position: absolute; // 포지션을 주고,
		      top: 100px; 		  // 보이기 원하는 위치를 지정
		      left: 0;
		      width: 300px; // 오리지널 사이즈
		      height: 200px;
		  } */
    </style>
	</head>
	<body>
		<%--container--%>
		<div class="container">
		<main>
		        <%--공백--%>
		<!-- <div class="b-example-divider"></div> -->
		
		<%--내용--%>
		<br>
		        
		<%
		ReviewDto dto = (ReviewDto)request.getAttribute("dto");
		%>
		<h2>수정</h2>
		<div align="center">
			<form action="reviewUpdateAf.do" id="frm" method="post">
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
							<input type="submit" id="reviewUpdateAf" value="수정완료">
						</td>
					</tr>
				</table>
			</form>
		</div>
    </main>

    <%--공백--%>
	<!--     <div class="b-example-divider"></div> -->
	
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#reviewUpdateAf").click(function(){
				
				$.ajax({
					type:"POST",
					url:"reviewUpdateAf.do",
					data: {
						"title" : $("title").val(),
						"content" : $("content").val()},
					success:function(str) {
						if(str == "REVIEW_UPDATE_OK") {
							alert("성공적으로 수정되었습니다.");
							location.href="review.do";
						}
					},
					error:function() {
						alert("수정에 실패했습니다.");
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