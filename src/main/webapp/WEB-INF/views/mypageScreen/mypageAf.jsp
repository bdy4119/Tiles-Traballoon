<%@page import="mul.cam.a.dto.MypageDto"%>
<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	MemberDto dto = (MemberDto)session.getAttribute("dto");
	// 로그인 -> 세션에 로그인정보 저장 -> 로그인이후에 페이지변환 -> responsebody무쓸모
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
						id="name" value="<%=session.getAttribute("name") %>">	
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">별명</label>
				<div class="col-sm-5">
					<input type=text class="form-control" id="nickname" value="<%= session.getAttribute("nickname")%>">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">이메일</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="email" value="<%= session.getAttribute("email") %>">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-5">
					<input type="password" class="form-control" id="pwd" value="<%= session.getAttribute("pwd") %>">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">연락처</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="phonenumber" value="<%= session.getAttribute("phonenumber") %>">
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">주소</label>
				<div class="col-sm-5">
					<input type="text" class="form-control" id="address" value="<%= session.getAttribute("address") %>">
				</div>
			</div>

			<div class="move-btn-wrap" align="center">
				<button type="button" class="btn btn-outline-secondary" style="--bs-btn-padding-y: 1rem; --bs-btn-padding-x: 1rem; --bs-btn-font-size: 1.1rem;">수정하기</button>
				<button type="button" class="btn btn-outline-secondary" style="--bs-btn-padding-y: 1rem; --bs-btn-padding-x: 2.2rem; --bs-btn-font-size: 1.1rem;">취소</button>
			</div>
			
			<form action="updateMember.do" method="post" id="frm" >
				<input type="hidden" name="nickname" id="nickname1">
				<input type="hidden" name="email" id="email1">
				<input type="hidden" name="pwd" id="pwd1">
				<input type="hidden" name="phonenumber" id="phonenumber1">
				<input type="hidden" name="address" id="address1">
				<input type="hidden" name="id" id="id1">
				<button type="button" id="updateBtn" class="btn btn-primary btn-block"> 수정  </button>
											 <!-- 함수생성 -->
				<button type="button" id="clBtn">a버튼</button>	
			</form>
		</div>
	</div><%-- nickname = #{nickname}, email=#{email}, pwd=#{pwd}, phonenumber=#{phonenumber}, address=#{address} --%>


<script type="text/javascript">
// 접근방식 자바스크립트 정식


// 자바스크립트 함수선언 */
// $("#clBtn").click(function(){
	/* var nickname = document.getElementById("nickname").value;      자바스크립트 정통 함수 활용*/
//	$("#nickname").val('test입니다');		// val() 안에 내가원하는값을 넣은것 set					/* jquery  함수 활용*/
//  document.getElementById("nickname").value = "test2입니다";		//set
	/* $("#nickname").val(''); */		/* val() 안에 아무것없으면값을 가져오고 작은따옴표를 넣으면 셋팅을해준다 */
//	alert($("#nickname").val());			// get
//	alert(document.getElementById("nickname").value);
// }); 

/* id updateBtn 을 클릭했을때 */
   
	 /* 값을 겟 */ 
$("#updateBtn").click(function(){
	var nickname = $("#nickname").val();
	var email = $("#email").val();
	var pwd = $("#pwd").val();
	var phonenumber = $("#phonenumber").val();
	var address = $("#address").val();
	alert(nickname);
	/* get한 값으로 set한것  form태그안의 value에 타겟팅*/
	/* 값을 보내줘야하기때문에 */
	$("#nickname1").val(nickname);
	$("#email1").val(email);
	$("#pwd1").val(pwd);
	$("#phonenumber1").val(phonenumber);
	$("#address1").val(address);
	$("#id1").val('<%=login.getId()%>');
	
	/* frm태그를 서브밋하게 만들어준다 */
	$("#frm").submit();
});
<%-- $(document).ready(function(){
	alert('<%=id%>');
}); --%>
	
//nickname의 빈칸 조사

//nickname의 중복 검사

//pwd의 빈칸 조사

//연락처 빈칸조사

//주소 빈칸조사 
</script>

</body>
</html>