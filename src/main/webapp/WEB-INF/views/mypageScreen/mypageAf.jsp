<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
      .b-example-divider {
            height: 1px;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 0.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
        .container {
	display: block;
	height: 50em;
}

.container2 {
	/* display: block; */
	width: auto;
	height: 100em;
	align: center;
	align-items: center;
	align-content: center;
}
</style>
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
	<div class="container border border-2">
		<!-- <div class="container2"> -->
			<div class="mb-3 row">
				<label for="staticEmail" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="staticEmail" value="<%-- <%=dto.getName()%> --%>">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">별명</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="inputnickname">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">이메일</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">연락처</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">주소</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="inputPassword">
				</div>
			</div>

			<div class="move-btn-wrap" align="center">
				<button type="button" class="btn btn-outline-secondary" style="--bs-btn-padding-y: 1rem; --bs-btn-padding-x: 1rem; --bs-btn-font-size: 1.1rem;">수정하기</button>
				<button type="button" class="btn btn-outline-secondary" style="--bs-btn-padding-y: 1rem; --bs-btn-padding-x: 2.2rem; --bs-btn-font-size: 1.1rem;">취소</button>
			</div>


		</div>
	</div>
</div> 
</body>
</html>