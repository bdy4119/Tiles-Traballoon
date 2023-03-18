<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	String id = login.getId();

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

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
	
	<div class="container">
		<div class="border-box">
			<div class="complete-wrap font-nt ls-05 word-break">
				<h3 align="center">떠나신다니 아쉬워요</h3>
				<div class="gap-1 hidden-md-down"></div>
				<!--
				<p>회원 탈퇴시, 적립된 포인트와 할인쿠폰은 모두 소멸됩니다.</p>
				<p>회원 탈퇴 후 탈퇴 일 기준 14일간 재가입이 불가능합니다.</p>
				-->
				<p align="center">그동안 이용해주셔서 감사드립니다</p>
				<div class="gap-1 hidden-md-up"></div>
			</div>
		</div>
		<!--/.border-box-->
	</div>
	<div class="gap-3 hidden-xs-down"></div>
	<div class="gap-1 hidden-sm-up"></div>
		<div class="container">
			<div class="card none-border">
				<div class="mb-3">
					<h4 class="card-title">남기시고 싶은 말씀을 남겨주세요.</h4>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="25"></textarea>
				</div>
			</div>
		</div>


	<div class="gap-3 hidden-xs-down"></div>
	<div class="gap-1 hidden-sm-up"></div>
	<div class="container">
		<div class="move-btn-wrap" align="center">
			<div class="form-group">
	
    </div> <!-- form-group// -->      
			<button type="button" class="btn btn-outline-secondary" style="--bs-btn-padding-y: 1rem; --bs-btn-padding-x: 2.2rem; --bs-btn-font-size: 1.1rem;">취소</button>
		</div>
		<form action="deleteMember.do" method="post" id="frm">
			<input type="hidden" name="id" id="id1" value="<%=login.getId()%>">
        	<button type="button" id="delBtn" class="btn btn-primary btn-block"> 삭제  </button>
    	</form>
	</div>
<p><%=login.getId() %></p>

<script type="text/javascript">

$("#delBtn").click(function(){
	var id = $("#id1").val();		// getter
	alert(id);
	
	$("#id1").val('<%=login.getId()%>');
	
	$("#frm").submit();
});
</script>
	

</body>
</html>