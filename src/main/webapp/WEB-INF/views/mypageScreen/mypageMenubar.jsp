<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <img src="images/pageimage/image01.jpg" class="img-fluid" alt="Responsive image">
</div><br><br>
	<div class="container">
		<div id="mypage-nav" class="hidden-md-down">
			<div class="row row-0 top">
				<div class="col-4">
					<a href="mypageAf.do"> 
					<img src="images/211731_contact_icon.png"> 
						<span class="txt-h4 ls-04">마이 페이지</span>
					</a>
				</div>
				<div class="col-4 active">
					<a href="mypageWishlist.do"> 
					<img
						src="images/211754_heart_icon.png"> 
						<span
						class="txt-h4 ls-04">위시리스트</span>
					</a>
				</div>

				<div class="col-4 ">
					<a href="mypageReviewAf.do?choice=검색&search=<%=login.getId()%>"> <img
						src="images/9165605_pencil_write_icon (1).png"><span
						class="txt-h4 ls-04">내가 쓴 게시글</span>
					</a>
				</div>
			</div>
			<div class="row row-0 bottom">
				<div class="col-6">
					<a href="mypageReference.do"> <img
						src="images/5355695_chat_comment_email_letter_mail_icon.png">
						<span class="txt-h4 ls-04">문의하기</span>
					</a>
				</div>
				<div class="col-6 active">
					<a href="mypageLeave.do"> <img
						src="images/211835_trash_icon.png"> <span
						class="txt-h4 ls-04">회원탈퇴</span>
					</a>
				</div>
			</div>
		</div>
	</div><br><br>
</body>
</html>