<%@page import="mul.cam.a.dto.MypageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <%
	MypageDto dto = (MypageDto)request.getAttribute("login");
	System.out.println(dto.toString());
%> --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>

<div class="container-fluid">
	<div align="center">
    	<img src="images/community.png" class="img-fluid">
		<main class="col-10 py-md-3 pl-md-5 bd-content" role="main">

			<div id="mypage-nav" class="hidden-md-down">
				<div class="row row-0 top">
					<div class="col-4 active">
							<a href="mypageAf.do"> 
						<div align="center">
								<img src="images/211731_contact_icon.png"> <span
								class="txt-h4 ls-04">마이 페이지</span>
						</div>
						</a>
					</div>

					<div class="col-4 ">
						<a href="wishlist.do">
							<div align="center">
								<img src="images/211754_heart_icon.png"> <span
									class="txt-h4 ls-04">위시리스트</span>
							</div>
						</a>
					</div>

					<div class="col-4 ">
						<a href="writeme.do">
							<div align="center">
								<img src="images/9165605_pencil_write_icon (1).png"> 
								<span class="txt-h4 ls-04">내가 쓴 글</span>
						</a>
					</div>
				</div>
				<div class="row row-0 bottom ">
					<div class="col-4 ">
						<a href="reference.do">
							<div align="center">
								<img
									src="images/5355695_chat_comment_email_letter_mail_icon.png">
								<span class="txt-h4 ls-04">문의하기</span>
						</a>
					</div>
				</div>
				<div class="col-4 ">
					<a href="leave.do">
						<div align="center">
							<img src="images/211835_trash_icon.png"> <span
								class="txt-h4 ls-04">회원탈퇴</span>
						</div>
					</a>
				</div>
			</div>
		</main>
	</div>
</div>
<table class="table table-dark table-sm">
	<thead>
		<tr>
			<th>작성자</th><th>글 제목</th><th>작성일자</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th></th><td></td><td></td>
		</tr>
	</tbody>
</table>
</body>
</html>