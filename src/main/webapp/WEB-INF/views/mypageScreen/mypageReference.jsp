<%@page import="mul.cam.a.dto.ReferenceDto"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String id = (String) request.getAttribute("id");
MemberDto login = (MemberDto) session.getAttribute("login");
%>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<head>
<style>
.board-sort {
	display: flex;
	align-items: left;
	padding-bottom: 15px;
	width: 150px;
	align: left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="board-sort">
			<select class="custom-select" id="sort" name="sort">
				<option selected>지역별 여행</option>
				<option value="Hotel">숙소 추천</option>
				<option value="review">여행 리뷰</option>
				<option value="community">커뮤니티</option>
			</select>
		</div>
		<div class="card none-border">
			<form action="addReference.do" method="get" id="frm">
				<div class="mb-3">
					<h4 class="card-title">
						<br>문의하기
					</h4>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="15" name="reftext" id="reftext"></textarea>
				</div>
				<div class="gap-3 hidden-xs-down"></div>
				<div class="gap-1 hidden-sm-up"></div>
				<br> <input type="hidden" name="id" id="id" value="<%=id%>">
				<button type="submit" id="delBtn" class="btn btn-outline-secondary"
					style="-bs-btn-padding-y: 1rem; - -bs-btn-padding-x: 2.2rem; - -bs-btn-font-size: 1.1rem;">문의하기</button>
				<button type="button" id="ccBtn" class="btn btn-outline-secondary"
					style="-bs-btn-padding-y: 3rem; - -bs-btn-padding-x: 3.3rem; - -bs-btn-font-size: 1.1rem;">취소</button>
			</form>
		</div>
	</div>
</html>