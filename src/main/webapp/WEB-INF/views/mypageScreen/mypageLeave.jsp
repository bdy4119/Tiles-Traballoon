<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
MemberDto login = (MemberDto) session.getAttribute("login");
String id = login.getId();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="border-box">
			<div class="complete-wrap font-nt ls-05 word-break">
				<h3 align="center">떠나신다니 아쉬워요</h3>
				<div class="gap-1 hidden-md-down"></div>

				<p align="center">그동안 이용해주셔서 감사드립니다</p>
				<br>
				<div class="gap-1 hidden-md-up"></div>
			</div>
		</div>
	</div>
	<div class="gap-3 hidden-xs-down"></div>
	<div class="gap-1 hidden-sm-up"></div>
	<div class="container">
		<div class="card none-border">
			<div class="mb-3">
				<h4 class="card-title">
					<br>남기시고 싶은 말씀을 남겨주세요.
				</h4>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="15"></textarea>
			</div>
		</div>
	</div>
	<div class="gap-3 hidden-xs-down"></div>
	<div class="gap-1 hidden-sm-up"></div><br>
	<div class="container">
		<form action="deleteMember.do" method="post" id="frm">
			<input type="hidden" name="id" id="id1" value="<%=login.getId()%>">
			<button type="button" id="delBtn" class="btn btn-outline-secondary"
				style="-bs-btn-padding-y: 1rem; - -bs-btn-padding-x: 2.2rem; - -bs-btn-font-size: 1.1rem;">탈퇴하기</button>

			<button type="button" id="ccBtn" class="btn btn-outline-secondary"
				style="-bs-btn-padding-y: 3rem; - -bs-btn-padding-x: 3.3rem; - -bs-btn-font-size: 1.1rem;">취소</button>
		</form>
	</div>
	<script type="text/javascript">

$("#delBtn").click(function(){
	var id = $("#id1").val();		// getter
	alert(id);
	
	$("#id1").val('<%=login.getId()%>');

			$("#frm").submit();
		});
		$("#ccBtn").click(function() {
			location.href = "mypageLeave.do";
		});
	</script>


</body>
</html>