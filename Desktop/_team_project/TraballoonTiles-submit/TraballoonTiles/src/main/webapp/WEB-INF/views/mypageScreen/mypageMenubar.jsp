<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>
<html>
<style>
.mybar{
	font-weight : bold;
	color : gray;
	font-family: Arial, sans-serif;
}
#img:hover{
  		 filter: grayscale(50%); /* 이미지 회색 톤 효과 추가 */
 		 transform: scale(1.2); /* 이미지 크기 약간 확대 */
 	}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    	<img src="pageimage/image01.jpg" class="img-fluid" alt="Responsive image">
</div><br><br>
	<div class="container">
		<div id="mypage-nav" class="hidden-md-down">
			<div class="row row-0 top">
				<div class="col-6">
					<a class="mybar" href="mypageAf.do"> 
					<img src="images/211731_contact_icon.png" id="img"> 
						<span class="txt-h4 ls-04">마이페이지</span>
					</a>
				</div>
				<div class="col-6 ">
					<a class="mybar" href="mypageReviewAf.do?choice=검색&search=<%=login.getId()%>"> <img
						src="images/9165605_pencil_write_icon (1).png" id="img"><span
						class="txt-h4 ls-04">내가 쓴 게시글</span>
					</a>
				</div>
			</div>
			<div class="row row-0 bottom">
				<div class="col-6">
					<a class="mybar" href="mypageReference.do"> <img
						src="images/5355695_chat_comment_email_letter_mail_icon.png" id="img">
						<span class="txt-h4 ls-04">문의하기</span>
					</a>
				</div>
				<div class="col-6 active">
					<a class="mybar" href="mypageLeave.do"> <img
						src="images/211835_trash_icon.png" id="img"> <span
						class="txt-h4 ls-04">회원탈퇴</span>
					</a>
				</div>
			</div>
		</div>
	</div><br><br>
</body>
</html>